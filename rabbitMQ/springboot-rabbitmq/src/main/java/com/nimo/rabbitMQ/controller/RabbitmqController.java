package com.nimo.rabbitMQ.controller;

import com.nimo.rabbitMQ.services.RabbitmqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: code-keep-practicing
 * @ClassName: RabbitmqController
 * @description:
 * @author: chuf
 * @create: 2022-03-23 15:10
 **/
@RestController
public class RabbitmqController {

    @Autowired
    private RabbitmqService rabbitmqService;

    @RequestMapping("/sendWork")
    public Object sendWork() {
        rabbitmqService.sendWork();
        return "work发送成功...";
    }

    @RequestMapping("/sendPublish")
    public Object sendPublish() {
        rabbitmqService.sendPublish();
        return "publish发送成功...";
    }

    @RequestMapping("/sendTopic")
    public String sendTopic() {
        rabbitmqService.sendTopic();
        return "Topic发送成功...";
    }

    @RequestMapping("/sendConfirm")
    public String sendConfirm() {
        rabbitmqService.sendConfirm();
        return "Confirm发送成功...";
    }

    @PostMapping(value = "/test")
    public String sendMessage(@RequestBody String message) {
        rabbitmqService.sendMessage(message);
        return "成功";
    }
}
