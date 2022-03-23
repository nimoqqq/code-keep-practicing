package com.nimo.rabbitMQ.config;

import lombok.Getter;
import org.springframework.amqp.core.Queue;
import org.springframework.boot.SpringBootConfiguration;
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

    @Bean
    public Queue queueWork1() {
        return new Queue(QUEUE_NAME);
    }
}
