package com.nimo.springbootjavabasic.designPattern.strategy;

import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @program: code-keep-practicing
 * @ClassName: WaiMai
 * @description: 外卖策略类
 * @author: chuf
 * @create: 2022-03-18 14:12
 **/
@Component
public class WaiMai extends AbstractStrategy implements Strategy {

    @PostConstruct
    private void init() {
        registerStrategy();
    }

    @Override
    public void issue(Object... params) {
        System.out.println("外卖策略类...");
    }
}
