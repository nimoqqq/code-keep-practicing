package com.nimo.springbootjavabasic;

import com.nimo.springbootjavabasic.designPattern.strategy.RewardService;
import com.nimo.springbootjavabasic.proxy.jdk.ClientService;
import com.nimo.springbootjavabasic.proxy.jdk.JdkProxyFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringbootJavaBasicApplicationTests {

    @Autowired
    private ClientService clientService;

    @Autowired
    private RewardService rewardService;

    @Test
    void contextLoads() {
    }

    @Test
    public void jdkProxy() {
        ClientService clientServiceProxy = (ClientService) JdkProxyFactory.getProxy(clientService);
        clientServiceProxy.send("hello....");
    }

    @Test
    public void strategy() {
        int[] arr = new int[]{1, 2, 3, 4};
        rewardService.issueReward("WaiMai", arr);
        System.out.println(".....");
    }
}
