package com.nimo.security.authentication;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.ExceptionMappingAuthenticationFailureHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @program: code-keep-practicing
 * @ClassName: SecurityAuthenticationFailureHandler
 * @description: 登录失败时的业务逻辑
 * @author: chuf
 * @create: 2022-01-15 12:10
 **/
public class SecurityAuthenticationFailureHandler extends ExceptionMappingAuthenticationFailureHandler {

    /**
     * AuthenticationException:异常信息
     */
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException {
        //直接输出json格式的响应信息
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(e.getMessage());
        out.flush();
        out.close();
    }
}
