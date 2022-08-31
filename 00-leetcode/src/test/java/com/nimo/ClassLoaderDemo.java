package com.nimo;

/**
 * @author : chuf
 * @date : 2022-08-31
 **/
public class ClassLoaderDemo {
    public static void main(String[] args) {
        System.out.println("ClassLodarDemo's ClassLoader is " + ClassLoaderDemo.class.getClassLoader());
        // ExtClassLoader JDK1.8之后改成了 PlatformClassLoader
        System.out.println("The Parent of ClassLodarDemo's ClassLoader is " + ClassLoaderDemo.class.getClassLoader().getParent());
        System.out.println("The GrandParent of ClassLodarDemo's ClassLoader is " + ClassLoaderDemo.class.getClassLoader().getParent().getParent());


        final ClassLoader systemClassLoader = ClassLoader.getSystemClassLoader();
        System.out.println(systemClassLoader);

        final ClassLoader extClassLoader = systemClassLoader.getParent();
        System.out.println(extClassLoader);

        final ClassLoader bootStrapClassLoader = extClassLoader.getParent();
        System.out.println(bootStrapClassLoader);

        //String类使用引导类加载器进行加载的->java核心类库都是使用引导类加载器加载的
        ClassLoader classLoader1 = String.class.getClassLoader();
        System.out.println(classLoader1);//null获取不到间接证明了String 类使用引导类加载器进行加载的
    }
}
