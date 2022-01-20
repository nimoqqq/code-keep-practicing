package com.nimo.springfilter.entity;

import com.nimo.springfilter.common.Encryptable;
import lombok.Data;

@Data
public class EncryptResponse<T> implements Encryptable {

    private Integer code;
    private T data;
}
