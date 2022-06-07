package com.nimo.springbootjavabasic.filterAndInterceptor;

import org.springframework.stereotype.Component;

import javax.servlet.*;
import java.io.IOException;

@Component
public class MyFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    /**
     *
     * @param servletRequest 上一个 filter 返回的 request
     * @param servletResponse 上一个 filter 返回的 response
     * @param filterChain 当前 filter，用来调用下一个 filter
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
