package com.nimo.easy.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @program: code-keep-practicing
 * @ClassName: FillData
 * @description:
 * @author: chuf
 * @create: 2022-03-28 10:12
 **/
@Getter
@Setter
@EqualsAndHashCode
public class FillData {
    private String name;
    private double number;
    private Date date;

}
