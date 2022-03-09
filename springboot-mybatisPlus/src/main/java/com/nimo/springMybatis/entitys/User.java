package com.nimo.springMybatis.entitys;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: springcloud-mybatisplus
 * @ClassName: User
 * @description:
 * @author: chuf
 * @create: 2022-03-09 13:44
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Long id;
    private String name;
    private Integer age;
    private String email;
}
