package com.nimo.springbootjavabasic.java8.my_interface;

/**
 * java8 接口
 * 可以实现方法，通过 default 或  static 修饰
 * default 修饰的方法，是普通实例方法，可以通过 this 调用，可以被子类继承和重写
 * static 修饰的方法，和一般静态类方法一样，不能被子类继承，只能用Interface 调用
 */
public interface MyInterfaceNew1 {

    default void def() {
        System.out.println("MyInterfaceNew1 一般方法 1");
    }
}
