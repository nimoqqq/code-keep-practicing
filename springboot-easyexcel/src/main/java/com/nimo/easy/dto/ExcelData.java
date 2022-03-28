package com.nimo.easy.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * @program: code-keep-practicing
 * @ClassName: ExcelData
 * @description:
 * @author: chuf
 * @create: 2022-03-28 09:43
 **/
@Getter
@Setter
@EqualsAndHashCode
public class ExcelData {
    private String name;
    private double number;
    private LocalDateTime date;
    private int age;
}
