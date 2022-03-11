package com.nimo.springbootjavabasic.java8.lambda;

/**
 * @program: code-keep-practicing
 * @ClassName: MyRunnableTest
 * @description:
 * @author: chuf
 * @create: 2022-03-11 13:43
 **/
public class MyRunnableTest {

    public static void main(String[] args) {
        Runnable runnable = () -> System.out.println("run....");
        Thread thread = new Thread(runnable);
        thread.start();
    }
}
