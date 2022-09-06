package com.nimo.jvm;

import org.openjdk.jol.info.ClassLayout;

/**
 * 查看对象头，计算对象大小
 * @author : chuf
 * @date : 2022-09-06
 **/
public class JOLSample {

    public static void main(String[] args) {
        final ClassLayout layout = ClassLayout.parseInstance(new Object());
        System.out.println(layout.toPrintable());

        System.out.println();
        ClassLayout layout1 = ClassLayout.parseInstance(new int[]{});
        System.out.println(layout1.toPrintable());

        System.out.println();
        ClassLayout layout2 = ClassLayout.parseInstance(new A());
        System.out.println(layout2.toPrintable());
    }

    public static class A {
        //8B mark word
        // 4B Klass Pointer 如果关闭压缩‐XX:‐UseCompressedClassPointers或‐XX:‐UseCompressedOops，则占用8B
        int id;    // 4B
        String name;    // 4B 如果关闭压缩‐XX:‐UseCompressedOops，则占用8B
        byte b;     // 1B
        Object o;   // 4B 如果关闭压缩‐XX:‐UseCompressedOops，则占用8B
    }
}
