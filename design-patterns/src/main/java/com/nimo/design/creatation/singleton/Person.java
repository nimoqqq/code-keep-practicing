package com.nimo.design.creatation.singleton;

/**
 * @author : chuf
 * @date : 2022-09-19
 **/
public class Person {

    private volatile static Person instance;

    private String name;

    private int age;

    private Person() {
    }

    public static Person getSingleton() {
        if (instance == null) {
            synchronized (Person.class) {
                if (instance == null) {
                    Person person = new Person();
                    instance = person;
                }
            }
        }
        return instance;
    }
}
