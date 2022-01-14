package com.nimo.security.config;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //1.基本配置认证方式
        http.authorizeRequests()
                //对任意请求都进行认证
                .anyRequest()
                .authenticated()
                .and()
                //开启 basic 认证
                .httpBasic();
    }
}
