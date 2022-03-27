package com.nimo.utils;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;

/**
 * @program: code-keep-practicing
 * @ClassName: RabbitMqUtils
 * @description:
 * @author: chuf
 * @create: 2022-03-27 13:07
 **/
public class RabbitMqUtils {

    public static Channel getChannel() throws Exception {
        final ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("127.0.0.1");
        factory.setPort(5672);
        factory.setUsername("guest");
        factory.setPassword("guest");
        final Connection connection = factory.newConnection();
        return connection.createChannel();
    }
}
