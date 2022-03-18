package com.nimo.springbootjavabasic.designPattern.strategy;

import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @program: code-keep-practicing
 * @ClassName: RewardService
 * @description: 策略服务
 * @author: chuf
 * @create: 2022-03-18 14:43
 **/
@Service
public class RewardService {

    public void issueReward(String rewardType, Object... params) {
        Strategy strategy = StrategyContext.getStrategy(rewardType);
        strategy.issue(params);
    }
}
