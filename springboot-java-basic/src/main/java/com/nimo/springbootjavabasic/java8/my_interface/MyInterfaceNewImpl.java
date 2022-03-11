package com.nimo.springbootjavabasic.java8.my_interface;

/**
 * @program: code-keep-practicing
 * @ClassName: MyInterfaceNewImpl
 * @description:
 * @author: chuf
 * @create: 2022-03-11 13:36
 **/
public class MyInterfaceNewImpl implements MyInterfaceNew, MyInterfaceNew1 {
    public static void main(String[] args) {
        MyInterfaceNewImpl myInterfaceNew = new MyInterfaceNewImpl();
        myInterfaceNew.def();
        myInterfaceNew.f();
    }

    @Override
    public void def() {
        MyInterfaceNew.super.def();
    }

    @Override
    public void f() {

    }
}
