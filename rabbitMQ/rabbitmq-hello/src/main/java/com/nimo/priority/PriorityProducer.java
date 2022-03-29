package com.nimo.priority;

import com.nimo.utils.RabbitMqUtils;
import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;

import java.util.HashMap;
import java.util.Map;

/**
 * @program: code-keep-practicing
 * @ClassName: PriorityProducer
 * @description: 优先级队列
 * @author: chuf
 * @create: 2022-03-29 12:24
 **/
public class PriorityProducer {
    private final static String QUEUE_NAME = "queue_name";


    public static void main(String[] args) throws Exception {

        try (final Channel channel = RabbitMqUtils.getChannel();) {
            Map<String, Object> arguments = new HashMap<>(1);
            arguments.put("x-max-priority", 10);

            channel.queueDeclare(QUEUE_NAME, false, false, false, arguments);
            //给消息赋予一个 priority 属性
            AMQP.BasicProperties properties = new AMQP.BasicProperties().builder().priority(5).build();
            for (int i = 1; i < 11; i++) {
                String message = "info" + i;
                if (i == 5) {
                    channel.basicPublish("", QUEUE_NAME, properties, message.getBytes());
                } else {

                    channel.basicPublish("", QUEUE_NAME, null, message.getBytes());
                }

                System.out.println("发送消息完成:" + message);
            }
        }
    }
}
