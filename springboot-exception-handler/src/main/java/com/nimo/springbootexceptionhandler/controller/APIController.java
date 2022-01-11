package com.nimo.springbootexceptionhandler.controller;

import com.google.common.collect.ImmutableMap;
import com.nimo.springbootexceptionhandler.entity.UserDTO;
import com.nimo.springbootexceptionhandler.enums.ErrorEnum;
import com.nimo.springbootexceptionhandler.exception.BizException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

/**
 * @program: code-keep-practicing
 * @ClassName: APIController
 * @description:
 * @author: chuf
 * @create: 2022-01-11 16:05
 **/
@RestController
@RequestMapping(value = "/api")
public class APIController {

    @GetMapping("/findUser")
    public String findById() {
        System.out.println("开始查询...");
        UserDTO userDTO = new UserDTO();
        userDTO.setId(1L);
        userDTO.setName("nimo");
        if(Objects.equals(1L, userDTO.getId())){
            throw new BizException(ErrorEnum.valueOf("NOT_FOUND"), ImmutableMap.of("user id", userDTO.getId()));
        }
        return userDTO.toString();
    }
}
