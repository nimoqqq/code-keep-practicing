package com.nimo.springbootexceptionhandler.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: code-keep-practicing
 * @ClassName: VMErrorController
 * @description:
 * @author: chuf
 * @create: 2022-03-11 17:12
 **/
@RestController
public class VMErrorController {

    /**
     * 模拟CPU占满
     */
    @GetMapping("/cpu/loop")
    public void testCPULoop() throws InterruptedException {
        System.out.println("请求cpu死循环");
        Thread.currentThread().setName("loop-thread-cpu");
        int num = 0;
        while (true) {
            num++;
            if (num == Integer.MAX_VALUE) {
                System.out.println("reset");
            }
            num = 0;
        }

    }
}
