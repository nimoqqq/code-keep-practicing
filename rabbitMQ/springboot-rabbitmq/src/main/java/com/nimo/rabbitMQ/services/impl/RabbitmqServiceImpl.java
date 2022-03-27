package com.nimo.rabbitMQ.services.impl;

import com.nimo.rabbitMQ.config.RabbitmqConfig;
import com.nimo.rabbitMQ.entitys.User;
import com.nimo.rabbitMQ.services.RabbitmqService;
import org.springframework.amqp.rabbit.connection.CorrelationData;
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
            // convertSendAndReceive 按照一定的顺序，只有确定消费者接收到消息，才会发送下一条信息，每条消息之间会有间隔时间
            // convertAndSend 输出时没有顺序，不需要等待，直接运行
            rabbitTemplate.convertAndSend(RabbitmqConfig.FANOUT_EXCHANGE, "", "测试publish模型: " + i);
        }
    }

    @Override
    public void sendTopic() {
        for (int i = 0; i < 10; i++) {
            if (i % 2 == 0) {
                rabbitTemplate.convertSendAndReceive(RabbitmqConfig.TOPIC_EXCHANGE, "topic.km.topic", "测试发布订阅模型：" + i);
            } else {
                rabbitTemplate.convertSendAndReceive(RabbitmqConfig.TOPIC_EXCHANGE, "topic.km", "测试发布订阅模型：" + i);
            }
        }
    }


    @Override
    public void sendConfirm() {
        rabbitTemplate.convertAndSend(RabbitmqConfig.QUEUE_CONFIRM, new User(1L, "km", "km123"), new CorrelationData("" + System.currentTimeMillis()));
        rabbitTemplate.setConfirmCallback(confirmCallback);
    }


    /**
     * 配置 confirm 机制
     */
    private final RabbitTemplate.ConfirmCallback confirmCallback = new RabbitTemplate.ConfirmCallback() {
        /**
         * @param correlationData 消息相关的数据，一般用于获取 唯一标识 id
         * @param b true 消息确认成功，false 失败
         * @param s 确认失败的原因
         */
        @Override
        public void confirm(CorrelationData correlationData, boolean b, String s) {
            if (b) {
                System.out.println("confirm 消息确认成功..." + correlationData.getId());
            } else {
                System.out.println("confirm 消息确认失败..." + correlationData.getId() + " cause: " + s);
            }
        }
    };
}
