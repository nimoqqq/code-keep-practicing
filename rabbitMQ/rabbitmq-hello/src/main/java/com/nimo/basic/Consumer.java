package com.nimo.basic;

import com.rabbitmq.client.*;
import lombok.extern.slf4j.Slf4j;

/**
 * @program: code-keep-practicing
 * @ClassName: Consumer
 * @description: 消费端
 * @author: chuf
 * @create: 2022-03-27 11:32
 **/
@Slf4j
public class Consumer {
    private final static String HELLO_QUEUE = "hello_queue";


    public static void main(String[] args) throws Exception {
        // 创建连接工厂
        final ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("127.0.0.1");
        factory.setPort(5672);
        factory.setUsername("guest");
        factory.setPassword("guest");

        // 建立连接，并创建信道
        try (Connection connection = factory.newConnection(); Channel channel = connection.createChannel()) {
            log.info("等待接收消息。。。");

            // 接收消息
            DeliverCallback deliverCallback = (consumerTag, message) -> log.info("接收到的消息: {}",message);
            //取消消息
            CancelCallback cancelCallback = (consumerTag) -> log.info("消息消费被中断");

            channel.basicConsume(HELLO_QUEUE, true, deliverCallback,cancelCallback);
        }
    }
}
