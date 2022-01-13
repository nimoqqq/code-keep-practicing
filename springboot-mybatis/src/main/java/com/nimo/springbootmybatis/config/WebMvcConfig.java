package com.nimo.springbootmybatis.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.FormContentFilter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {

    /**
     * HttpPutFormContentFilter 在 5.1 之后过时，使用 FormContentFilter 替换
     * @return
     */
    @Bean
    public FormContentFilter formContentFilter() {
        return new FormContentFilter();
    }
}
