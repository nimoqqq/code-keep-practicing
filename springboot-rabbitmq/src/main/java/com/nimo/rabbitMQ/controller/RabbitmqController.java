package com.nimo.rabbitMQ.controller;

import com.nimo.rabbitMQ.services.RabbitmqService;
import org.springframework.beans.factory.annotation.Autowired;
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
        return "发送成功...";
    }
}
