package com.nimo.security.authentication;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @program: code-keep-practicing
 * @ClassName: SecurityAuthenticationSuccessHandler
 * @description: 登录成功时的业务逻辑
 * @author: chuf
 * @create: 2022-01-15 11:54
 **/
public class SecurityAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    /**
     *
     * @param request 实现服务端的跳转
     * @param response 实现客户端的跳转，也可以返回 JSON 数据
     * @param authentication 保存了登录成功的用户信息
     */
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response, Authentication authentication) throws IOException {
        //直接输出json格式的响应信息
        Object principal = authentication.getPrincipal();
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        //以json格式对外输出身份信息
        out.write(new ObjectMapper().writeValueAsString(principal));
        out.flush();
        out.close();
    }
}
