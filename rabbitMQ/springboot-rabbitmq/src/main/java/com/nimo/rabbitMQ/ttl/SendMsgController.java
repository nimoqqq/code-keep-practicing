package com.nimo.rabbitMQ.ttl;

import com.nimo.rabbitMQ.config.RabbitmqConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * @program: code-keep-practicing
 * @ClassName: SendMsgController
 * @description:
 * @author: chuf
 * @create: 2022-03-28 22:28
 **/
@Slf4j
@RequestMapping("ttl")
@RestController
public class SendMsgController {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @GetMapping("sendMsg/{message}")
    public void sendMsg(@PathVariable String message) {
        log.info("当前时间： {},发送一条信息给两个 TTL 队列 :{}", new Date(), message);
        rabbitTemplate.convertAndSend(RabbitmqConfig.X_EXCHANGE, "XA", "消息来自 ttl 为 10S 的队列 : " + message);
        rabbitTemplate.convertAndSend(RabbitmqConfig.X_EXCHANGE, "XB", "消息来自 ttl 为 40S 的队列: " + message);
    }
}
