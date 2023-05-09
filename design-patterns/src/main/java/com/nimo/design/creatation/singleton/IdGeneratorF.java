package com.nimo.design.creatation.singleton;

import java.util.concurrent.ConcurrentHashMap;

/**
 * 线程内单例
 *
 * @author : chuf
 * @date : 2023-05-09
 **/
public class IdGeneratorF {

    private static final ConcurrentHashMap<Long, IdGeneratorF> INSTANCES = new ConcurrentHashMap<>();

    private IdGeneratorF() {
    }

    public static IdGeneratorF getInstance() {
        long currentThreadId = Thread.currentThread().getId();
        INSTANCES.put(currentThreadId, new IdGeneratorF());
        return INSTANCES.get(currentThreadId);
    }
}
