package com.nimo.springbootjavabasic.designPattern.strategy;

import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @program: code-keep-practicing
 * @ClassName: Hotel
 * @description: 酒旅策略类
 * @author: chuf
 * @create: 2022-03-18 14:14
 **/
@Component
public class Hotel extends AbstractStrategy implements Strategy {

    @PostConstruct
    private void init() {
        registerStrategy();
    }

    @Override
    public void issue(Object... params) {
        System.out.println("酒旅策略类。。。");
    }
}
