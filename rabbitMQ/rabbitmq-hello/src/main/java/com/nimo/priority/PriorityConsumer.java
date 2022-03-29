package com.nimo.priority;

import com.rabbitmq.client.*;
import lombok.extern.slf4j.Slf4j;

/**
 * @program: code-keep-practicing
 * @ClassName: PriorityConsumer
 * @description:
 * @author: chuf
 * @create: 2022-03-29 12:30
 **/
@Slf4j
public class PriorityConsumer {
    private final static String QUEUE_NAME = "queue_name";


    public static void main(String[] args) throws Exception {
        // 创建连接工厂
        final ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("127.0.0.1");
        factory.setPort(5672);
        factory.setUsername("guest");
        factory.setPassword("guest");

        // 建立连接，并创建信道
        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();

        log.info("等待接收消息。。。");
        // 接收消息
        DeliverCallback deliverCallback = (consumerTag, message) -> log.info(new String(message.getBody()));
        //取消消息
        CancelCallback cancelCallback = (consumerTag) -> log.info("消息消费被中断");

        /*
         * 消费者消费消息
         * 1. 队列
         * 2. 自动 ack
         * 3. 回调
         */
        channel.basicConsume(QUEUE_NAME, true, deliverCallback, cancelCallback);
    }
}
