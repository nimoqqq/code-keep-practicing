package com.nimo.rabbitMQ.listener;

import com.nimo.rabbitMQ.config.RabbitmqConfig;
import com.nimo.rabbitMQ.entitys.User;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @program: code-keep-practicing
 * @ClassName: ConfirmReceiveListener
 * @description:
 * @author: chuf
 * @create: 2022-03-23 17:26
 **/
@Component
public class ConfirmReceiveListener {

    @RabbitListener(queues = RabbitmqConfig.QUEUE_CONFIRM)
    public void receiveMsg(User user) {
        System.out.println("接收到的消息为：" + user);
    }
}

