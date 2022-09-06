package com.nimo.jvm;

/**
 * 类不是一次性全部加载的
 *
 * @author : chuf
 * @date : 2022-09-06
 **/
public class TestDynamicLoad {

    static {
        System.out.println("*************load TestDynamicLoad************");
    }

    public static void main(String[] args) {
        new A();
        System.out.println("*************load test************");
        //B不会加载，除非这里执行 new B()
        B b = null;
    }
}

class A {
    static {
        System.out.println("*************load A************");
    }

    public A() {
        System.out.println("*************initial A************");
    }
}

class B {

    static {
        System.out.println("*************load B************");
    }

    public B() {
        System.out.println("*************initial B************");
    }
}
