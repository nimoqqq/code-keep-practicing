package com.nimo.rabbitMQ.entitys;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @program: code-keep-practicing
 * @ClassName: User
 * @description:
 * @author: chuf
 * @create: 2022-03-23 15:00
 **/
@NoArgsConstructor
@AllArgsConstructor
@Data
public class User implements Serializable {

    private Long id;
    private String name;
    private String password;
}
