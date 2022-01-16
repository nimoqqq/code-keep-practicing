package com.nimo.security.config;

import com.nimo.security.filter.VerificationCodeFilter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

//@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    /**
     * 用来定义哪些请求需要忽略安全控制，哪些请求必须接受安全控制;还可以在合适的时候清除SecurityContext以避免内存泄漏，
     * 同时也可以用来定义请求防火墙和请求拒绝处理器，另外我们开启Spring Security Debug模式也是这里配置的
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        //super.configure(web);
        web.ignoring()
                .antMatchers("/js/**", "/css/**", "/images/**");
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //2.表单配置认证方式
        http.authorizeRequests()
                //对任意请求都进行认证
                .anyRequest()
                .authenticated()
                //用and来表示配置过滤器结束，以便进行下一个过滤器的创建和配置
                .and()
                //设置表单登录，创建UsernamePasswordAuthenticationFilter
                .formLogin()
                .loginPage("/login.html")
                .permitAll()
                //指登录成功后，是否始终跳转到登录成功url。它默认为false
                .defaultSuccessUrl("/index.html",true)
                //post登录接口，登录验证由系统实现
                .loginProcessingUrl("/login")
                //用户密码错误跳转接口
                .failureUrl("/error.html")
                //要认证的用户参数名，默认username
                .usernameParameter("username")
                //要认证的密码参数名，默认password
                .passwordParameter("password")
                .and()
                //配置注销
                .logout()
                //注销接口
                .logoutUrl("/logout")
                //注销成功后跳转到的接口
                .logoutSuccessUrl("/myLogin.html")
                .permitAll()
                //删除自定义的cookie
                .deleteCookies("myCookie")
                .and()
                //注意:需禁用crsf防护功能,否则登录不成功（crsf 跨站请求伪造）
                .csrf()
                .disable();

        //将过滤器添加在UsernamePasswordAuthenticationFilter之前
        http.addFilterBefore(new VerificationCodeFilter(), UsernamePasswordAuthenticationFilter.class);
    }



    //    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        //1.基本配置认证方式
//        http.authorizeRequests()
//                //对任意请求都进行认证
//                .anyRequest()
//                .authenticated()
//                .and()
//                //开启 basic 认证
//                .httpBasic();
//    }
}
