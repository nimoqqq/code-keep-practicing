# 工程简介

# 延伸阅读

参考链接：[mybatis 与 spring 整合](http://www.tianshouzhi.com/api/tutorials/mybatis/392)

# 开发中的问题
## PUT 请求接收不到入参
[Spring Boot实践--PUT请求不能接收到参数的问题](https://my.oschina.net/spinachgit/blog/1802199)

## WebMvcConfigurerAdapter过时问题
[Springboot2.0中WebMvcConfigurerAdapter过时问题处理](https://blog.csdn.net/zhuzhezhuzhe1/article/details/80580197)

[【SpringBoot】使用WebMvcConfigurer配置SpringMVC](https://blog.csdn.net/qq877728715/article/details/110678656)

因为官方在spring5弃用了 WebMvcConfigurerAdapter，因为springboot2.0使用的spring5，所以会出现过时。但是这个问题也很好解决，我们只需要实现 WebMvcConfigurer接口就可以了。