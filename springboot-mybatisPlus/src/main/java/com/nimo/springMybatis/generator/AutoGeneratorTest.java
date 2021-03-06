package com.nimo.springMybatis.generator;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.Collections;

/**
 * @program: code-keep-practicing
 * @ClassName: AutoGeneratorTest
 * @description:
 * @author: chuf
 * @create: 2022-03-09 14:20
 **/
public class AutoGeneratorTest {
    public static void main(String[] args) {
        FastAutoGenerator.create("jdbc:mysql://localhost:3306/my", "root", "123456")
                .globalConfig(builder -> {
                    builder.author("chuf") // 设置作者
                            .enableSwagger() // 开启 swagger 模式
                            .fileOverride() // 覆盖已生成文件
                            .commentDate("yyyy-MM-dd hh:mm:ss")
                            .dateType(DateType.ONLY_DATE)
                            .outputDir(System.getProperty("user.dir") + "/src/main/java")
                            .disableOpenDir(); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("com") // 设置父包名
                            .moduleName("mp") // 设置模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, "Users/chuf/workingSoftware")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("user"); // 设置需要生成的表名
//                            .addTablePrefix("t_", "c_"); // 设置过滤表前缀
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
}
