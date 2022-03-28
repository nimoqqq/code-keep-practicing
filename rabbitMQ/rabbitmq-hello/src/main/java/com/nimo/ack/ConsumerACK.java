package com.nimo.ack;

import com.nimo.utils.RabbitMqUtils;
import com.nimo.utils.SleepUtils;
import com.rabbitmq.client.CancelCallback;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.DeliverCallback;
import lombok.extern.slf4j.Slf4j;

/**
 * @program: code-keep-practicing
 * @ClassName: ConsumerACK
 * @description: 消息手动应答
 * @author: chuf
 * @create: 2022-03-27 13:40
 **/
@Slf4j
public class ConsumerACK {
    private final static String ACK_WORK = "ack_work";

    public static void main(String[] args) throws Exception {
        final Channel channel = RabbitMqUtils.getChannel();

        log.info("C2等待接收消息。。。");
        // 接收消息
        DeliverCallback deliverCallback = (consumerTag, message) -> {
            SleepUtils.sleep(1);
            log.info(new String(message.getBody()));
            /*
             * 手动应答
             * 1.消息标记 tag
             * 2.是否批量应答未应答消息
             */
            channel.basicAck(message.getEnvelope().getDeliveryTag(), false);
        };
        //取消消息
        CancelCallback cancelCallback = (consumerTag) -> log.info("消息消费被中断");

        /*
         * 消费者消费消息
         * 1. 队列
         * 2. 自动 ack 默认为 true 自动提交
         * 3. 回调
         */
        // 不公平分发
        int prefetchCount = 1;
        channel.basicQos(prefetchCount);

        // 手动提交 ACK 确认消息
        boolean autoAck = false;
        channel.basicConsume(ACK_WORK, autoAck, deliverCallback, cancelCallback);
    }
}
