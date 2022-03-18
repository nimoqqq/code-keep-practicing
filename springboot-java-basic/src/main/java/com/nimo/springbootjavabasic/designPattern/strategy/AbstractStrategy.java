package com.nimo.springbootjavabasic.designPattern.strategy;

/**
 * @program: code-keep-practicing
 * @ClassName: AbstractStrategy
 * @description: 抽象策略类
 * @author: chuf
 * @create: 2022-03-18 13:57
 **/
public abstract class AbstractStrategy implements Strategy {

    /**
     * 类注册方法
     */
    public void registerStrategy() {
        StrategyContext.registerStrategy(getClass().getSimpleName(), this);
    }
}
