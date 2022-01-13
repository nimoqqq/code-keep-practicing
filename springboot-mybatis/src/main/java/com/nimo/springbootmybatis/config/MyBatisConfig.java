package com.nimo.springbootmybatis.config;

import com.github.pagehelper.PageHelper;
import org.apache.ibatis.logging.nologging.NoLoggingImpl;
import org.apache.ibatis.plugin.Interceptor;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;

/**
 * @program: code-keep-practicing
 * @ClassName: MyBatisConfig
 * @description:
 * @author: chuf
 * @create: 2022-01-13 23:22
 **/
//@Configuration
public class MyBatisConfig {

    @Value("${mybatis.mapper-locations}")
    private String mapperLocations;

    @Bean
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource dataSource() {
        return DataSourceBuilder.create().build();

    }

    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactoryBean configurationSqlSessionFactoryBean(DataSource dataSource) throws IOException {
        final SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        final org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
        //标准输出日志
        // configuration.setLogImpl(StdOutImpl.class);
        // 不输出日志
        configuration.setLogImpl(NoLoggingImpl.class);
        sqlSessionFactoryBean.setConfiguration(configuration);

        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        // 设置mapper文件扫描路径
        sqlSessionFactoryBean.setMapperLocations(resolver.getResources(mapperLocations));
        sqlSessionFactoryBean.setDataSource(dataSource);
        return sqlSessionFactoryBean;
    }
}
