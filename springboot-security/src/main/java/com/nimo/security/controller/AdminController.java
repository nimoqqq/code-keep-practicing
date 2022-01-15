package com.nimo.security.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: code-keep-practicing
 * @ClassName: AdminController
 * @description: admin
 * @author: chuf
 * @create: 2022-01-15 12:33
 **/
@RestController
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/hello")
    public String hello() {

        return "hello, admin";
    }
}
