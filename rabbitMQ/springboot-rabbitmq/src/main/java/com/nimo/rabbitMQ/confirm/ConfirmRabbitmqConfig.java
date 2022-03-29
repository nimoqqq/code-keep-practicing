package com.nimo.rabbitMQ.confirm;

import org.springframework.amqp.core.*;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

/**
 * @program: code-keep-practicing
 * @ClassName: ConfirmRabbitmqConfig
 * @description: 确认发布
 * @author: chuf
 * @create: 2022-03-29 11:42
 **/
@Configuration
public class ConfirmRabbitmqConfig {

    public static final String CONFIRM_EXCHANGE_NAME = "confirm.exchange";
    public static final String CONFIRM_QUEUE_NAME = "confirm.queue";

    /**
     * 声明业务 Exchange
     *
     * @return
     */
    @Bean("confirmExchange")
    public DirectExchange confirmExchange() {

        return new DirectExchange(CONFIRM_EXCHANGE_NAME);
    }

    /**
     * 声明确认队列
     *
     * @return
     */
    @Bean("confirmQueue")
    public Queue confirmQueue() {

        return QueueBuilder.durable(CONFIRM_QUEUE_NAME).build();
    }

    /**
     * 声明确认队列绑定关系
     *
     * @param queue
     * @param exchange
     * @return
     */
    @Bean
    public Binding queueBinding(@Qualifier("confirmQueue") Queue queue, @Qualifier("confirmExchange") DirectExchange exchange) {
        return BindingBuilder.bind(queue).to(exchange).with("key1");
    }
}
