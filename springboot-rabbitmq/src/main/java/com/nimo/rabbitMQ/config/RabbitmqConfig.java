package com.nimo.rabbitMQ.config;

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
@SpringBootConfiguration
@Configuration
public class RabbitmqConfig {

    @Bean
    public Queue queueWork1() {
        return new Queue("queue_work");
    }
}
