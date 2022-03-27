package com.nimo.rabbitMQ.services;

/**
 * @program: code-keep-practicing
 * @ClassName: RabbitmqService
 * @description:
 * @author: chuf
 * @create: 2022-03-23 15:11
 **/
public interface RabbitmqService {

    /**
     * work 模式
     */
    void sendWork();

    /**
     * 发布订阅模式
     */
    void sendPublish();

    /**
     * Topic模式
     */
    void sendTopic();

    /**
     * confirm 机制
     */
    void sendConfirm();
}
