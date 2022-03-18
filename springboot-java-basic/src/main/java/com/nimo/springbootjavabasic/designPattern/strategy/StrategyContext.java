package com.nimo.springbootjavabasic.designPattern.strategy;

import java.util.HashMap;
import java.util.Map;

/**
 * @program: code-keep-practicing
 * @ClassName: SrategyContext
 * @description: 策略注册中心
 * @author: chuf
 * @create: 2022-03-18 13:50
 **/
public class StrategyContext {

    private static final Map<String, Strategy> registerMap = new HashMap<>();

    /**
     * 注册策略
     * @param type :策略类型
     * @param strategy : 策略类{@link Strategy}
     */
    public static void registerStrategy(String type, Strategy strategy) {
        registerMap.put(type, strategy);
    }

    /**
     * 获取策略
     * @param type :策略类型
     * @return : {@link Strategy}
     */
    public static Strategy getStrategy(String type) {
        return registerMap.get(type);
    }
}
