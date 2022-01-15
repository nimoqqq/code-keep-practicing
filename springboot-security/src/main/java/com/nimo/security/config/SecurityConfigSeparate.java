package com.nimo.security.config;

import com.nimo.security.authentication.SecurityAuthenticationEntryPoint;
import com.nimo.security.authentication.SecurityAuthenticationFailureHandler;
import com.nimo.security.authentication.SecurityAuthenticationSuccessHandler;
import com.nimo.security.authentication.SecurityLogoutSuccessHandler;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * @program: code-keep-practicing
 * @ClassName: SecurityConfigSeparate
 * @description: 前后端分离
 * @author: chuf
 * @create: 2022-01-15 12:01
 **/
@EnableWebSecurity
public class SecurityConfigSeparate extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .anyRequest()
                .authenticated()
                .and()
                .formLogin()
                .permitAll()
                //认证成功时的处理器
                .successHandler(new SecurityAuthenticationSuccessHandler())
                //认证失败时的处理器
                .failureHandler(new SecurityAuthenticationFailureHandler())
                .and()
                .logout()
                //退出登录
                .logoutSuccessHandler(new SecurityLogoutSuccessHandler())
                .and()
                .csrf()
                .disable()
                .exceptionHandling()
                //未登录时的处理器
                .authenticationEntryPoint(new SecurityAuthenticationEntryPoint());
    }
}
