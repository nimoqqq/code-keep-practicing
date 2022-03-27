package com.nimo.rabbitMQ.listener;

import com.nimo.rabbitMQ.config.RabbitmqConfig;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @program: code-keep-practicing
 * @ClassName: TopicReceiveListener
 * @description: Topic
 * @author: chuf
 * @create: 2022-03-23 17:14
 **/
@Component
public class TopicReceiveListener {

    @RabbitListener(queues = RabbitmqConfig.QUEUE_TOPIC1)
    public void receiveMsg1(String msg) {
        System.out.println("消费者1接收到：" + msg);
    }

    @RabbitListener(queues = RabbitmqConfig.QUEUE_TOPIC2)
    public void receiveMsg2(String msg) {
        System.out.println("消费者2接收到：" + msg);
    }
}
