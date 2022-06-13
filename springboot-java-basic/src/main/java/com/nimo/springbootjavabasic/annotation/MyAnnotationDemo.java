package com.nimo.springbootjavabasic.annotation;

/**
 * @author : chuf
 * @date : 2022-06-13
 **/
@MyAnnotation(getValue = "class")
public class MyAnnotationDemo {

    @MyAnnotation(getValue = "name")
    private String name;

    @MyAnnotation(getValue = "sex")
    public String sex;

    @MyAnnotation(getValue = "method")
    public void demo() {
        System.out.println("demo...");
    }

    @MyAnnotation()
    public void defaultMethod() {
        System.out.println("defaultMethod...");
    }
}
