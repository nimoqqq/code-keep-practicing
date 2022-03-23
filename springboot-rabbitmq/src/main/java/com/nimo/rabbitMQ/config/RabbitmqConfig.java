package com.nimo.rabbitMQ.config;

import lombok.Getter;
import org.springframework.amqp.core.*;
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

    //=======================work start==========================

    public static final String QUEUE_NAME = "queue_work";

    @Bean
    public Queue queueWork1() {
        return new Queue(QUEUE_NAME);
    }

    //=======================work end==========================

    //=======================发布订阅模式 start==========================

    public static final String QUEUE_FANOUT1 = "queue_Fanout1";
    public static final String QUEUE_FANOUT2 = "queue_Fanout2";

    public static final String FANOUT_EXCHANGE = "exchange_fanout";


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

    //=======================发布订阅模式 end==========================

    //=======================topic模型 start==========================

    public static final String QUEUE_TOPIC1 = "queue_topic1";
    public static final String QUEUE_TOPIC2 = "queue_topic2";

    public static final String TOPIC_EXCHANGE = "exchange_topic";

    public static final String TOPIC1 = "topic.#";
    public static final String TOPIC2 = "topic.*";

    @Bean
    public Queue queueTopic1() {
        return new Queue(QUEUE_TOPIC1);
    }

    @Bean
    public Queue queueTopic2() {
        return new Queue(QUEUE_TOPIC2);
    }

    @Bean
    public TopicExchange exchangeTopic() {
        return new TopicExchange(TOPIC_EXCHANGE);
    }

    @Bean
    public Binding bindingTopic1() {
        return BindingBuilder.bind(queueTopic1()).to(exchangeTopic()).with(TOPIC1);
    }

    @Bean
    public Binding bindingTopic2() {
        return BindingBuilder.bind(queueTopic2()).to(exchangeTopic()).with(TOPIC2);
    }

    //=======================topic模型 end==========================


    //=======================confirm start==========================

    public static final String QUEUE_CONFIRM = "queue_confirm";

    @Bean
    public Queue queueConfirm() {
        return new Queue(QUEUE_CONFIRM);
    }

    //=======================confirm end==========================
}
