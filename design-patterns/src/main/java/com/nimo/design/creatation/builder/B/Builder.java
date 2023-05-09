package com.nimo.design.creatation.builder.B;

import org.springframework.util.StringUtils;

/**
 * @author : chuf
 * @date : 2023-05-09
 **/
public class Builder extends AbstractBuilder {

    @Override
    public ResourcePoolConfigB build() {
        // 校验逻辑放到这里来做，包括必填项校验、依赖关系校验、约束条件校验等
        if (StringUtils.isEmpty(name)) {
            throw new IllegalArgumentException("...");
        }
        if (maxIdle > maxTotal) {
            throw new IllegalArgumentException("...");
        }
        if (minIdle > maxTotal || minIdle > maxIdle) {
            throw new IllegalArgumentException("...");
        }

        return new ResourcePoolConfigB(this);
    }

    @Override
    AbstractBuilder customName(String name) {
        if (StringUtils.isEmpty(name)) {
            throw new IllegalArgumentException("...");
        }
        this.name = name;
        return this;
    }

    @Override
    AbstractBuilder customMaxTotal(int maxTotal) {
        if (maxTotal <= 0) {
            throw new IllegalArgumentException("...");
        }
        this.maxTotal = maxTotal;
        return this;
    }

    @Override
    AbstractBuilder customMaxIdle(int maxIdle) {
        if (maxIdle < 0) {
            throw new IllegalArgumentException("...");
        }
        this.maxIdle = maxIdle;
        return this;
    }

    @Override
    AbstractBuilder customMinIdle(int minIdle) {
        if (minIdle < 0) {
            throw new IllegalArgumentException("...");
        }
        this.minIdle = minIdle;
        return this;
    }
}
