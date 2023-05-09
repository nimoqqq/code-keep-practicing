package com.nimo.design.creatation.builder.B;

/**
 * 抽象建造者
 *
 * @author : chuf
 * @date : 2023-05-09
 **/
public abstract class AbstractBuilder {

    private static final int DEFAULT_MAX_TOTAL = 8;
    private static final int DEFAULT_MAX_IDLE = 8;
    private static final int DEFAULT_MIN_IDLE = 0;

    protected String name;
    protected int maxTotal = DEFAULT_MAX_TOTAL;
    protected int maxIdle = DEFAULT_MAX_IDLE;
    protected int minIdle = DEFAULT_MIN_IDLE;

    ResourcePoolConfigB resourcePoolConfig;

    abstract AbstractBuilder customName(String name);

    abstract AbstractBuilder customMaxTotal(int maxTotal);

    abstract AbstractBuilder customMaxIdle(int maxIdle);

    abstract AbstractBuilder customMinIdle(int minIdle);

    abstract ResourcePoolConfigB build();
}
