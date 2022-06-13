package com.nimo.springbootjavabasic.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * @author : chuf
 * @date : 2022-06-13
 **/
@Retention(RetentionPolicy.RUNTIME)
public @interface MyAnnotation {

    String getValue() default "no description";

}
