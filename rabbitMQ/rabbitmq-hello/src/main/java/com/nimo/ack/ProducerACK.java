package com.nimo.ack;

import com.nimo.utils.RabbitMqUtils;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.MessageProperties;
import lombok.extern.slf4j.Slf4j;

import java.util.Scanner;

/**
 * @program: code-keep-practicing
 * @ClassName: ProducerACK
 * @description: ACk 确认
 * @author: chuf
 * @create: 2022-03-27 15:34
 **/
@Slf4j
public class ProducerACK {

    private final static String ACK_WORK = "ack_work";

    public static void main(String[] args) throws Exception {

        // 建立连接，并创建信道
        try (Channel channel = RabbitMqUtils.getChannel();) {
            /*
             * 生成一个队列
             * 1.队列名称
             * 2.队列里面的消息是否持久化 默认消息存储在内存中
             * 3.该队列是否只供一个消费者进行消费 是否进行共享 true 可以多个消费者消费
             * 4.是否自动删除 最后一个消费者端开连接以后 该队列是否自动删除 true 自动删除
             * 5.其他参数
             */
            channel.queueDeclare(ACK_WORK, true, false, false, null);
            /*
             * 从控制台当中接受信息
             * 发送消息
             * 1.交换机
             * 2.路由
             * 3.其他参数
             * 4.发送消息体
             */
            Scanner scanner = new Scanner(System.in);
            while (scanner.hasNext()) {
                String message = scanner.next();
                channel.basicPublish("", ACK_WORK, MessageProperties.PERSISTENT_TEXT_PLAIN, message.getBytes());
                System.out.println("发送消息完成:" + message);
                log.info("发送消息完成: {}", message);
            }
        }
    }
}
