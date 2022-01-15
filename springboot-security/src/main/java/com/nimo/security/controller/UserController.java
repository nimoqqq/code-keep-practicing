package com.nimo.security.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: code-keep-practicing
 * @ClassName: UserController
 * @description: user
 * @author: chuf
 * @create: 2022-01-15 12:34
 **/
@RestController
@RequestMapping("/user")
public class UserController {

    @GetMapping("hello")
    public String hello() {

        return "hello, user";
    }
}
