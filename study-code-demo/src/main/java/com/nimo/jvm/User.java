package com.nimo.jvm;

/**
 * @author : chuf
 * @date : 2022-09-06
 **/
public class User {
    private Integer id;

    private String name;

    private int age;

    public User(Integer id, String name, int age) {
        this.id = id;
        this.name = name;
        this.age = age;
    }

    public User() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    protected void finalize() throws Throwable {
        // 避免对象被回收
        OOMTest.list.add(this);
//        System.out.println("关闭资源, userId = " + id + "即将被回收");
    }
}
