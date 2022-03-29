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
     * 交换机备份
     */
    public static final String BACKUP_EXCHANGE_NAME = "backup.exchange";
    public static final String BACKUP_QUEUE_NAME = "backup.queue";
    public static final String WARNING_QUEUE_NAME = "warning.queue";

    /**
     * 声明确认 Exchange 交换机的备份交换机
     *
     * @return
     */
    @Bean("confirmExchange")
    public DirectExchange confirmExchange() {
        ExchangeBuilder exchangeBuilder = ExchangeBuilder.directExchange(CONFIRM_EXCHANGE_NAME).durable(true)
                //设置该交换机的备份交换机
                .withArgument("alternate-exchange", BACKUP_EXCHANGE_NAME);
        return (DirectExchange) exchangeBuilder.build();
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

    /**
     * 声明备份 Exchange
     */
    @Bean("backupExchange")
    public FanoutExchange backupExchange() {
        return new FanoutExchange(BACKUP_EXCHANGE_NAME);
    }

    /**
     * 声明备份队列
     *
     * @return
     */
    @Bean("backQueue")
    public Queue backQueue() {
        return QueueBuilder.durable(BACKUP_QUEUE_NAME).build();
    }

    /**
     * 声明报警队列
     *
     * @return
     */
    @Bean("warningQueue")
    public Queue warningQueue() {
        return QueueBuilder.durable(WARNING_QUEUE_NAME).build();
    }

    /**
     * 声明报警队列绑定关系
     *
     * @param queue
     * @param backupExchange
     * @return
     */
    @Bean
    public Binding warningBinding(@Qualifier("warningQueue") Queue queue, @Qualifier("backupExchange") FanoutExchange backupExchange) {
        return BindingBuilder.bind(queue).to(backupExchange);
    }

    /**
     * 声明备份队列绑定关系
     * @param queue
     * @param backupExchange
     * @return
     */
    @Bean
    public Binding backupBinding(@Qualifier("backQueue") Queue queue, @Qualifier("backupExchange") FanoutExchange backupExchange) {
        return BindingBuilder.bind(queue).to(backupExchange);
    }
}
