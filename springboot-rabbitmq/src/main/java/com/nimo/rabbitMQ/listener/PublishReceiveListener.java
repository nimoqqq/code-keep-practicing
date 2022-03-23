package com.nimo.rabbitMQ.listener;

import com.nimo.rabbitMQ.config.RabbitmqConfig;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @program: code-keep-practicing
 * @ClassName: PublishReceiveListener
 * @description: 消费端-发布订阅模式
 * @author: chuf
 * @create: 2022-03-23 16:42
 **/
@Component
public class PublishReceiveListener {

    @RabbitListener(queues = RabbitmqConfig.QUEUE_FANOUT1)
    public void receiveMsg1(String msg) {
        System.out.println("队列1接收到消息：" + msg);
    }

    @RabbitListener(queues = RabbitmqConfig.QUEUE_FANOUT2)
    public void receiveMsg2(String msg) {
        System.out.println("队列2接收到消息：" + msg);
    }
}
