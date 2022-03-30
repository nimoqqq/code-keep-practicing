package com.nimo.confirm;

import com.nimo.utils.RabbitMqUtils;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.ConfirmCallback;

import java.util.UUID;
import java.util.concurrent.ConcurrentNavigableMap;
import java.util.concurrent.ConcurrentSkipListMap;

/**
 * @program: code-keep-practicing
 * @ClassName: ProducerConfirm
 * @description: 发布确认
 * @author: chuf
 * @create: 2022-03-28 17:45
 **/
public class ProducerConfirm {

    private final static String CONFIRM_WORK = "confirm_work";

    public static void main(String[] args) throws Exception {

        try (final Channel channel = RabbitMqUtils.getChannel();) {
            final String s = UUID.randomUUID().toString();
            channel.queueDeclare(CONFIRM_WORK, true, false, false, null);
            // 开启发布确认
            channel.confirmSelect();
            final long begin = System.currentTimeMillis();
            for (int i = 0; i < 10; i++) {
                String message = i + "";
                channel.basicPublish("", CONFIRM_WORK, null, message.getBytes());

                //服务端返回 false 或超时时间内未返回，生产者可以消息重发
                boolean flag = channel.waitForConfirms();
                if (flag) {
                    System.out.println("消息发送成功");
                }
            }
        }
    }


    /**
     * 批量确认
     *
     * @throws Exception
     */
    public static void publishMessageBatch() throws Exception {

        try (final Channel channel = RabbitMqUtils.getChannel();) {
            final String s = UUID.randomUUID().toString();
            channel.queueDeclare(CONFIRM_WORK, true, false, false, null);
            // 开启发布确认
            channel.confirmSelect();
            //批量确认消息大小
            int batchSize = 100;
            //未确认消息个数
            int outstandingMessageCount = 0;

            final long begin = System.currentTimeMillis();
            for (int i = 0; i < 10; i++) {
                String message = i + "";
                channel.basicPublish("", CONFIRM_WORK, null, message.getBytes());
                outstandingMessageCount++;
                if (outstandingMessageCount == batchSize) {
                    boolean flag = channel.waitForConfirms();
                    outstandingMessageCount = 0;
                }
            }
            //为了确保还有剩余没有确认消息 再次确认
            if (outstandingMessageCount > 0) {
                channel.waitForConfirms();
            }
            long end = System.currentTimeMillis();
            System.out.println("发布" + 10 + "个批量确认消息,耗时" + (end - begin) + "ms");
        }
    }

    /**
     * 异步确认
     *
     * @throws Exception
     */
    public static void publishMessageAsync() throws Exception {

        try (final Channel channel = RabbitMqUtils.getChannel();) {
            final String queueName = UUID.randomUUID().toString();
            channel.queueDeclare(queueName, true, false, false, null);
            // 开启发布确认
            channel.confirmSelect();
            ConcurrentSkipListMap<Long, String> outstandingConfirms = new ConcurrentSkipListMap<>();

            ConfirmCallback ackCallback = (sequenceNumber, multiple) -> {
                if (multiple) {
                    //返回的是小于等于当前序列号的未确认消息 是一个 map
                    ConcurrentNavigableMap<Long, String> confirmed = outstandingConfirms.headMap(sequenceNumber, true);
                    //清除该部分未确认消息
                    confirmed.clear();
                } else { //只清除当前序列号的消息
                    outstandingConfirms.remove(sequenceNumber);
                }

            };

            ConfirmCallback nackCallback = (sequenceNumber, multiple) -> {
                String message = outstandingConfirms.get(sequenceNumber);
                System.out.println("发布的消息" + message + "未被确认，序列号" + sequenceNumber);
            };

            /*
             * 添加一个异步确认的监听器
             * 1.确认收到消息的回调
             * 2.未收到消息的回调
             */
            channel.addConfirmListener(ackCallback, nackCallback);
            long begin = System.currentTimeMillis();
            for (int i = 0; i < 10; i++) {
                String message = "消息" + i;
                /*
                 * channel.getNextPublishSeqNo() 获取下一个消息的序列号
                 * 通过序列号与消息体进行一个关联
                 * 全部都是未确认的消息体
                 */
                outstandingConfirms.put(channel.getNextPublishSeqNo(), message);
                channel.basicPublish("", queueName, null, message.getBytes());

            }
            long end = System.currentTimeMillis();
            System.out.println("发布" + 10 + "个异步确认消息,耗时" + (end - begin) + "ms");
        }
    }
}
