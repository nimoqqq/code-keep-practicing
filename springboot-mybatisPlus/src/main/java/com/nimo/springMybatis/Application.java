package com.nimo.springMybatis;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @program: code-keep-practicing
 * @ClassName: Application
 * @description:
 * @author: chuf
 * @create: 2022-03-09 14:01
 **/
@SpringBootApplication
@MapperScan("com.nimo.springMybatis.mapper")
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
