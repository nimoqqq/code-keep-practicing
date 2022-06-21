package com.nimo.redis.controller;

import com.nimo.redis.utils.RedisUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * @author : chuf
 * @date : 2022-06-20
 **/
@RestController
@RequestMapping(value = "/redis")
public class RedisTsetController {

    @GetMapping("/save")
    public void save() {
        RedisUtil redisUtil = new RedisUtil();
        redisUtil.set("test", LocalDateTime.now() + "");
    }

    @GetMapping("/getRedis")
    public String getUsers() {
        RedisUtil redisUtil = new RedisUtil();
        String test = (String) redisUtil.get("test");
        System.out.println("=====>" + test);
        return test;
    }
}
