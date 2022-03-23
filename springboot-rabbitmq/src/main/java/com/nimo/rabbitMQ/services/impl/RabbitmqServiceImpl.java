package com.nimo.rabbitMQ.services.impl;

import com.nimo.rabbitMQ.config.RabbitmqConfig;
import com.nimo.rabbitMQ.services.RabbitmqService;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: code-keep-practicing
 * @ClassName: RabbitmqServiceImpl
 * @description:
 * @author: chuf
 * @create: 2022-03-23 15:11
 **/
@Service
public class RabbitmqServiceImpl implements RabbitmqService {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Override
    public void sendWork() {
        for (int i = 0; i < 10; i++) {
            rabbitTemplate.convertAndSend(RabbitmqConfig.QUEUE_NAME, "测试work模型: " + i);
        }
    }

    @Override
    public void sendPublish() {
        for (int i = 0; i < 5; i++) {
            rabbitTemplate.convertAndSend(RabbitmqConfig.FANOUT_EXCHANGE, "", "测试publish模型: " + i);
        }
    }
}
