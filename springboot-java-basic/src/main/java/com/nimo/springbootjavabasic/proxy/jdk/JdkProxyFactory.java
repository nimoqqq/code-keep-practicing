package com.nimo.springbootjavabasic.proxy.jdk;

import java.lang.reflect.Proxy;

public class JdkProxyFactory {

    public static Object getProxy(Object target){
        /**
         * 第一个参数：people.getClass().getClassLoader()，使用handler对象的classloader对象来加载我们的代理对象
         * 第二个参数：people.getClass().getInterfaces()，这里为代理类提供的接口是真实对象实现的接口，这样代理对象就能像真实对象一样调用接口中的所有方法
         * 第三个参数：handler，我们将代理对象关联到上面的InvocationHandler对象上
         */
        return Proxy.newProxyInstance(
                target.getClass().getClassLoader(),
                target.getClass().getInterfaces(),
                new ClientProxyHandler(target)
        );
    }
}
