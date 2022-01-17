package com.nimo.spring_aop;

import com.nimo.spring_aop.annotation.CatAopTest;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SpringAopApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringAopApplication.class, args);
    }

    @CatAopTest
    @RequestMapping("/first")
    public String first(){
        return "first controller";
    }
}
