package com.nimo.springbootexceptionhandler.entity;

import java.io.Serializable;

/**
 * @program: code-keep-practicing
 * @ClassName: User
 * @description:
 * @author: chuf
 * @create: 2022-01-11 15:59
 **/
public class UserDTO implements Serializable {

    private Long id;
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
