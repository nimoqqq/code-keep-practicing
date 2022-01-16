package com.nimo.security.exception;

import org.springframework.security.core.AuthenticationException;

/**
 * @program: code-keep-practicing
 * @ClassName: VerificationCodeException
 * @description: 验证码异常
 * @author: chuf
 * @create: 2022-01-16 14:13
 **/
public class VerificationCodeException extends AuthenticationException {

    public VerificationCodeException () {
        super("图形验证码校验失败");
    }

}
