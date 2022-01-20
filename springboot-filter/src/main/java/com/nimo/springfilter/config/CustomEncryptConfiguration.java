package com.nimo.springfilter.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimo.springfilter.filter.CustomEncryptFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @program: code-keep-practicing
 * @ClassName: CustomEncryptConfiguration
 * @description:
 * @author: chuf
 * @create: 2022-01-19 23:55
 **/
@Configuration
public class CustomEncryptConfiguration {

    @Bean
    public FilterRegistrationBean<CustomEncryptFilter> customEncryptFilter(ObjectMapper objectMapper){
        FilterRegistrationBean<CustomEncryptFilter> bean = new FilterRegistrationBean<>(new CustomEncryptFilter(objectMapper));
        // 只过滤 app 相关请求
        bean.addUrlPatterns("/e/*");
        return bean;
    }
}
