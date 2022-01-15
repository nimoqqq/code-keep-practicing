package com.nimo.security.authentication;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @program: code-keep-practicing
 * @ClassName: SecurityLogoutSuccessHandler
 * @description: 退出登录
 * @author: chuf
 * @create: 2022-01-15 12:13
 **/
public class SecurityLogoutSuccessHandler implements LogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write("注销成功");
        out.flush();
        out.close();
    }
}
