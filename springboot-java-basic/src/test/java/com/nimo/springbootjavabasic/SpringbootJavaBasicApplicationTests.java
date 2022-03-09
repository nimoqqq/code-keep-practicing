package com.nimo.springbootjavabasic;

import com.nimo.springbootjavabasic.proxy.jdk.ClientService;
import com.nimo.springbootjavabasic.proxy.jdk.JdkProxyFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringbootJavaBasicApplicationTests {

    @Autowired
    private ClientService clientService;

    @Test
    void contextLoads() {
    }

    @Test
    public void jdkProxy(){
        ClientService clientServiceProxy = (ClientService)JdkProxyFactory.getProxy(clientService);
        clientServiceProxy.send("hello....");
    }
}
