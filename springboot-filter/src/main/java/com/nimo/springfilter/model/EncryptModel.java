package com.nimo.springfilter.model;

import lombok.Data;

@Data
public class EncryptModel<T> {
    private T data;
    private Long timestamp;
    private String sign;
}
