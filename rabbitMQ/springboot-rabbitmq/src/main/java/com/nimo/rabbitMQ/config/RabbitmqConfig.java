package com.nimo.rabbitMQ.config;

import lombok.Getter;
import org.springframework.amqp.core.*;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

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

    //=======================ttl start==========================

    public static final String X_EXCHANGE = "x_exchange";

    public static final String QUEUE_A = "qa";
    public static final String QUEUE_B = "qb";

    public static final String Y_DEAD_LETTER_EXCHANGE = "y_dead_letter_exchange";

    public static final String DEAD_LETTER_QUEUE = "qd";

    // 死信队列
    public static final String QUEUE_C = "qc";

    @Bean("xExchange")
    public DirectExchange xExchange() {
        return new DirectExchange(X_EXCHANGE);
    }

    @Bean("yExchange")
    public DirectExchange yExchange() {
        return new DirectExchange(Y_DEAD_LETTER_EXCHANGE);
    }

    @Bean("queueA")
    public Queue queueA() {
        Map<String, Object> map = new HashMap<>(3);

        //声明当前队列绑定的死信交换机
        map.put("x-dead-letter-exchange", Y_DEAD_LETTER_EXCHANGE);
        //声明当前队列的死信路由 key
        map.put("x-dead-letter-routing-key", "YD");
        //声明队列的 TTL
        map.put("x-message-ttl", 10000);

        return QueueBuilder.durable(QUEUE_A).withArguments(map).build();
    }

    /**
     * 声明队列 A 绑定 X 交换机
     *
     * @param queueA    队列
     * @param xExchange 交换机
     * @return {@link Binding}
     */
    @Bean
    public Binding queueBindingXA(@Qualifier("queueA") Queue queueA,
                                  @Qualifier("xExchange") DirectExchange xExchange) {
        return BindingBuilder.bind(queueA).to(xExchange).with("XA");
    }

    /**
     * 声明队列 B ttl 为 40s 并绑定到对应的死信交换机
     *
     * @return {@link Queue}
     */
    @Bean("queueB")
    public Queue queueB() {
        Map<String, Object> map = new HashMap<>(3);

        //声明当前队列绑定的死信交换机
        map.put("x-dead-letter-exchange", Y_DEAD_LETTER_EXCHANGE);
        //声明当前队列的死信路由 key
        map.put("x-dead-letter-routing-key", "YD");
        //声明队列的 TTL
        map.put("x-message-ttl", 40000);

        return QueueBuilder.durable(QUEUE_B).withArguments(map).build();
    }

    @Bean
    public Binding queueBindingXB(@Qualifier("queueB") Queue queueB,
                                  @Qualifier("xExchange") DirectExchange xExchange) {
        return BindingBuilder.bind(queueB).to(xExchange).with("XB");
    }

    /**
     * 声明死信队列 QD
     *
     * @return
     */
    @Bean("queueD")
    public Queue queueD() {
        return new Queue(DEAD_LETTER_QUEUE);
    }

    /**
     * 声明死信队列 QD 绑定关系
     * @param queueD 死信队列
     * @param yExchange 死信交换机
     * @return
     */
    @Bean
    public Binding deadLetterBindingQAD(@Qualifier("queueD") Queue queueD,
                                        @Qualifier("yExchange") DirectExchange yExchange) {

        return BindingBuilder.bind(queueD).to(yExchange).with("YD");
    }

    //=======================ttl end==========================
}
