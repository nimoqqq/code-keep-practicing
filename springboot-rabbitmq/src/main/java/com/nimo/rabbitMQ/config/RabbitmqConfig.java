package com.nimo.rabbitMQ.config;

import lombok.Getter;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.FanoutExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @program: code-keep-practicing
 * @ClassName: RabbitmqConfig
 * @description:
 * @author: chuf
 * @create: 2022-03-23 15:02
 **/
@Configuration
@Getter
public class RabbitmqConfig {
    public static final String QUEUE_NAME = "queue_work";

    public static final String QUEUE_FANOUT1 = "queue_Fanout1";
    public static final String QUEUE_FANOUT2 = "queue_Fanout2";

    public static final String FANOUT_EXCHANGE = "exchange_fanout";


    @Bean
    public Queue queueWork1() {
        return new Queue(QUEUE_NAME);
    }

    @Bean
    public Queue queueFanout1() {
        return new Queue(QUEUE_FANOUT1);
    }

    @Bean
    public Queue queueFanout2() {
        return new Queue(QUEUE_FANOUT2);
    }

    /**
     * 交换机
     *
     * @return {@link FanoutExchange}
     */
    @Bean
    public FanoutExchange exchangeFanout() {
        return new FanoutExchange(FANOUT_EXCHANGE);
    }

    /**
     * 交换机和队列进行绑定
     *
     * @return {@link Binding}
     */
    @Bean
    public Binding bindingExchange1() {
        return BindingBuilder.bind(queueFanout1()).to(exchangeFanout());
    }

    @Bean
    public Binding bindingExchange2() {
        return BindingBuilder.bind(queueFanout2()).to(exchangeFanout());
    }
}
