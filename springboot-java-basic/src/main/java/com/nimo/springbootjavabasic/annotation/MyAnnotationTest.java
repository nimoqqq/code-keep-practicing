package com.nimo.springbootjavabasic.annotation;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * @author : chuf
 * @date : 2022-06-13
 **/
public class MyAnnotationTest {

    public static void main(String[] args) throws Exception {
        // 获取类上的注解
        Class<MyAnnotationDemo> clazz = MyAnnotationDemo.class;
        MyAnnotation annotationOnClass = clazz.getAnnotation(MyAnnotation.class);
        System.out.println(annotationOnClass.getValue());

        // 获取成员变量上的注解
        Field name = clazz.getDeclaredField("name");
        MyAnnotation annotationOnField = name.getAnnotation(MyAnnotation.class);
        System.out.println(annotationOnField.getValue());

        Field sex = clazz.getField("sex");
        MyAnnotation annotationOnFieldSex = sex.getAnnotation(MyAnnotation.class);
        System.out.println(annotationOnFieldSex.getValue());

        // 获取hello方法上的注解
        Method hello = clazz.getMethod("demo", (Class<?>[]) null);
        MyAnnotation annotationOnMethod = hello.getAnnotation(MyAnnotation.class);
        System.out.println(annotationOnMethod.getValue());

        // 获取defaultMethod方法上的注解
        Method defaultMethod = clazz.getMethod("defaultMethod", (Class<?>[]) null);
        MyAnnotation annotationOnDefaultMethod = defaultMethod.getAnnotation(MyAnnotation.class);
        System.out.println(annotationOnDefaultMethod.getValue());

    }
}
