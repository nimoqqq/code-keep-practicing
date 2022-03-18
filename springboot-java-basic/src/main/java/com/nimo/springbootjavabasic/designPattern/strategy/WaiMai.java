package com.nimo.springbootjavabasic.designPattern.strategy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    private static final Logger LOGGER = LoggerFactory.getLogger(WaiMai.class);

    @PostConstruct
    private void init() {
        LOGGER.info("开始注册策略类...");
        registerStrategy();
    }

    @Override
    public void issue(Object... params) {
        System.out.println("外卖策略类...");
    }
}
