package com.nimo.rabbitMQ.listener;

import com.nimo.rabbitMQ.config.RabbitmqConfig;
import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @program: code-keep-practicing
 * @ClassName: WorkReceiveListener
 * @description: 消费端监听-work模式
 * @author: chuf
 * @create: 2022-03-23 15:16
 **/
@Component
public class WorkReceiveListener {

    @RabbitListener(queues = RabbitmqConfig.QUEUE_NAME)
    public void receiveMessage(String msg, Channel channel, Message message) {
        // 只包含发送的消息
        System.out.println("1接收到消息：" + msg);
        // channel 通道信息
        // message 附加的参数信息
    }


    @RabbitListener(queues = RabbitmqConfig.QUEUE_NAME)
    public void receiveMessage2(Object obj, Channel channel, Message message) {
        // 包含所有的信息
        System.out.println("2接收到消息：" + obj);
    }

}
