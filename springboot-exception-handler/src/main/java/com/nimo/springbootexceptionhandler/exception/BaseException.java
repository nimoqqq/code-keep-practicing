package com.nimo.springbootexceptionhandler.exception;

import com.nimo.springbootexceptionhandler.enums.ErrorEnum;
import org.springframework.util.ObjectUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @program: code-keep-practicing
 * @ClassName: BaseException
 * @description: 异常基础接口,方便以后自定义异常类
 * @author: chuf
 * @create: 2022-01-11 16:02
 **/
public abstract class BaseException extends RuntimeException {
    private ErrorEnum error;

    private Map<String, Object> data = new HashMap<>();

    public BaseException(ErrorEnum error, Map<String, Object> data) {
        this.error = error;
        if (!ObjectUtils.isEmpty(data)) {
            this.data.putAll(data);
        }
    }

    public ErrorEnum getError() {
        return error;
    }

    public Map<String, Object> getData() {
        return data;
    }
}
