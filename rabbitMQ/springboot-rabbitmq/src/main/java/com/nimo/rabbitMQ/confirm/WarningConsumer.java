package com.nimo.rabbitMQ.confirm;

import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @program: code-keep-practicing
 * @ClassName: WarningConsumer
 * @description: 报警消费者
 * @author: chuf
 * @create: 2022-03-29 12:02
 **/
@Component
@Slf4j
public class WarningConsumer {

    public static final String WARNING_QUEUE_NAME = "warning.queue";

    @RabbitListener(queues = WARNING_QUEUE_NAME)
    public void receiveWarningMsg(Message message) {
        String msg = new String(message.getBody());
        log.error("报警发现不可路由消息：{}", msg);
    }
}
