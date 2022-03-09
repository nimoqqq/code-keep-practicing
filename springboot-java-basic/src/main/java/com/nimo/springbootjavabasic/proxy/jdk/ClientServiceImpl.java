package com.nimo.springbootjavabasic.proxy.jdk;

import org.springframework.stereotype.Service;

@Service
public class ClientServiceImpl implements ClientService{
    @Override
    public String send(String message) {
        System.out.println(message);
        return message;
    }
}
