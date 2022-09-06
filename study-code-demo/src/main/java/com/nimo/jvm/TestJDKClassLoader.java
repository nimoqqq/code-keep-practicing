package com.nimo.jvm;

import sun.misc.Launcher;

import java.net.URL;

/**
 * @author : chuf
 * @date : 2022-09-06
 **/
public class TestJDKClassLoader {

    public static void main(String[] args) {
        System.out.println("ClassLodarDemo's ClassLoader is " + TestJDKClassLoader.class.getClassLoader());
        // ExtClassLoader JDK1.8之后改成了 PlatformClassLoader
        System.out.println("The Parent of ClassLodarDemo's ClassLoader is " + TestJDKClassLoader.class.getClassLoader().getParent());
        System.out.println("The GrandParent of ClassLodarDemo's ClassLoader is " + TestJDKClassLoader.class.getClassLoader().getParent().getParent());


        final ClassLoader systemClassLoader = ClassLoader.getSystemClassLoader();
        System.out.println(systemClassLoader);

        final ClassLoader extClassLoader = systemClassLoader.getParent();
        System.out.println(extClassLoader);

        final ClassLoader bootStrapClassLoader = extClassLoader.getParent();
        System.out.println(bootStrapClassLoader);

        //String类使用引导类加载器进行加载的->java核心类库都是使用引导类加载器加载的
        ClassLoader classLoader1 = String.class.getClassLoader();
        //null获取不到间接证明了String 类使用引导类加载器进行加载的
        System.out.println(classLoader1);

        System.out.println();
        System.out.println("bootstrapLoader加载以下文件：");
        URL[] urls = Launcher.getBootstrapClassPath().getURLs();
        for (int i = 0; i < urls.length; i++) {
            System.out.println(urls[i]);
        }

        System.out.println();
        System.out.println("extClassloader加载以下文件：");
        System.out.println(System.getProperty("java.ext.dirs"));

        System.out.println();
        System.out.println("appClassLoader加载以下文件：");
        System.out.println(System.getProperty("java.class.path"));
    }

    static class MyClassLoader extends ClassLoader {

        @Override
        protected Class<?> findClass(String name) throws ClassNotFoundException {
            return super.findClass(name);
        }


    }
}
