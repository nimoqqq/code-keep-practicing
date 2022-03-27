package com.nimo.basic;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeoutException;

/**
 * @program: code-keep-practicing
 * @ClassName: producer
 * @description: 基础模式、生产者
 * @author: chuf
 * @create: 2022-03-27 11:14
 **/
public class Producer {

    private final static String HELLO_QUEUE = "hello_queue";

    public static void main(String[] args) throws IOException, TimeoutException {
        // 创建连接工厂
        final ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("127.0.0.1");
        factory.setPort(5672);
        factory.setUsername("guest");
        factory.setPassword("guest");

        // 建立连接，并创建信道
        try (Connection connection = factory.newConnection(); Channel channel = connection.createChannel()) {
            /*
             * 生成一个队列
             * 1.队列名称
             * 2.队列里面的消息是否持久化 默认消息存储在内存中
             * 3.该队列是否只供一个消费者进行消费 是否进行共享 true 可以多个消费者消费
             * 4.是否自动删除 最后一个消费者端开连接以后 该队列是否自动删除 true 自动删除
             * 5.其他参数
             */
            channel.queueDeclare(HELLO_QUEUE, false, false, false, null);
            String message = "hello world";

            /*
             * 发送消息
             * 1.交换机
             * 2.路由
             * 3.其他参数
             * 4.发送消息体
             */
            channel.basicPublish("", HELLO_QUEUE, null, message.getBytes(StandardCharsets.UTF_8));
        }
    }
}
