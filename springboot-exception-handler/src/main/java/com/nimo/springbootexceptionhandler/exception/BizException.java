package com.nimo.springbootexceptionhandler.exception;

import com.nimo.springbootexceptionhandler.enums.ErrorEnum;

import java.util.Map;

/**
 * @program: code-keep-practicing
 * @ClassName: BizException
 * @description: 业务异常
 * @author: chuf
 * @create: 2022-01-11 16:02
 **/
public class BizException extends BaseException{

    public BizException(ErrorEnum error, Map<String, Object> data) {
        super(error, data);
    }

}
