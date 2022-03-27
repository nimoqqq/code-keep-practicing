package com.nimo.work;

import com.nimo.utils.RabbitMqUtils;
import com.rabbitmq.client.*;
import lombok.extern.slf4j.Slf4j;

/**
 * @program: code-keep-practicing
 * @ClassName: Consumer
 * @description: 消费端
 * @author: chuf
 * @create: 2022-03-27 11:32
 **/
@Slf4j
public class Work01 {
    private final static String HELLO_WORK = "hello_work";


    public static void main(String[] args) throws Exception {
        final Channel channel = RabbitMqUtils.getChannel();

        log.info("C2等待接收消息。。。");
        // 接收消息
        DeliverCallback deliverCallback = (consumerTag, message) -> log.info(new String(message.getBody()));
        //取消消息
        CancelCallback cancelCallback = (consumerTag) -> log.info("消息消费被中断");

        /*
         * 消费者消费消息
         * 1. 队列
         * 2. 自动 ack
         * 3. 回调
         */
        channel.basicConsume(HELLO_WORK, true, deliverCallback, cancelCallback);
    }
}
