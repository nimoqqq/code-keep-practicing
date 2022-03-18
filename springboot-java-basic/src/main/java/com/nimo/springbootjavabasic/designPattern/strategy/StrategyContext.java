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
public class SrategyContext {

    private static final Map<String, Srategy> registerMap = new HashMap<>();

    // 注册策略
    public static void registerSrategy(String type, Srategy srategy) {
        registerMap.put(type, srategy);
    }

    // 获取策略
    public static Srategy getSrategy(String type) {
        return registerMap.get(type);
    }
}
