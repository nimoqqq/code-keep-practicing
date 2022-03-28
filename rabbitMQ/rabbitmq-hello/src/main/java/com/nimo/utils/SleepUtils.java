package com.nimo.utils;

/**
 * @program: code-keep-practicing
 * @ClassName: SleepUtils
 * @description:
 * @author: chuf
 * @create: 2022-03-27 16:05
 **/
public class SleepUtils {

    public static void sleep(int second){
        try {
            Thread.sleep(1000L * second);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
