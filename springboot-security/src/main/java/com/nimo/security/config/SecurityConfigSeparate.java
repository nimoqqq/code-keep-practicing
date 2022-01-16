package com.nimo.security.config;

import com.nimo.security.services.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

import javax.sql.DataSource;

/**
 * @program: code-keep-practicing
 * @ClassName: SecurityConfigSeparate
 * @description: 前后端分离
 * @author: chuf
 * @create: 2022-01-15 12:01
 **/
@EnableWebSecurity(debug = true)
public class SecurityConfigSeparate extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/admin/**")
                .hasRole("ADMIN")
                .antMatchers("/user/**")
                .hasAnyRole("USER","ADMIN")
                .antMatchers("/visitor/**")
                .permitAll()
                .anyRequest()
                .authenticated()
                .and()
                .formLogin()
                .permitAll();
//                //认证成功时的处理器
//                .successHandler(new SecurityAuthenticationSuccessHandler())
//                //认证失败时的处理器
//                .failureHandler(new SecurityAuthenticationFailureHandler())
//                .and()
//                .logout()
//                //退出登录
//                .logoutSuccessHandler(new SecurityLogoutSuccessHandler())
//                .and()
//                .csrf()
//                .disable()
//                .exceptionHandling()
//                //未登录时的处理器
//                .authenticationEntryPoint(new SecurityAuthenticationEntryPoint());
    }


    /***************************************在默认的数据库中创建用户和角色****************************************************/
//    @Autowired
//    private DataSource dataSource;
//
//    @Bean
//    public UserDetailsService createUserDetailService() {
//        JdbcUserDetailsManager manager = new JdbcUserDetailsManager();
//        manager.setDataSource(dataSource);
//
//        if (!manager.userExists("user")) {
//            manager.createUser(User.withUsername("user").password("123").roles("USER").build());
//        }
//
//        if (!manager.userExists("admin")) {
//            manager.createUser(User.withUsername("admin").password("123").roles("USER", "ADMIN").build());
//        }
//
//        return manager;
//    }
//
//    /**
//     * 简单地把字符序列转成字符串
//     * password 不加密以字符串存储
//     * @return
//     */
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return NoOpPasswordEncoder.getInstance();
//    }


    /***************************************在数据库中创建用户和角色****************************************************/
    @Autowired
    private UserServiceImpl userService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //关联UserDetailsService对象
        auth.userDetailsService(userService)
                //暂时不对密码进行加密配置
                .passwordEncoder(NoOpPasswordEncoder.getInstance());
    }

}
