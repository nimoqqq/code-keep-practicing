package com.nimo.security.authentication;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @program: code-keep-practicing
 * @ClassName: SecurityAuthenticationEntryPoint
 * @description: 未登录访问页面
 * @author: chuf
 * @create: 2022-01-15 12:16
 **/
public class SecurityAuthenticationEntryPoint implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write("尚未登录，请先登录");
        out.flush();
        out.close();
    }
}
