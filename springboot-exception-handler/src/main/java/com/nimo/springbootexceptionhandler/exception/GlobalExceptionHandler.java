package com.nimo.springbootexceptionhandler.exception;

import com.nimo.springbootexceptionhandler.result.ResultResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: code-keep-practicing
 * @ClassName: GlobalExceptionHandler
 * @description: 全局异常处理
 * @author: chuf
 * @create: 2022-01-11 16:03
 **/
@ControllerAdvice
@ResponseBody
public class GlobalExceptionHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(value = BaseException.class)
    public ResultResponse baseExceptionHandler(BaseException ex, HttpServletRequest request){
        LOGGER.error("发生异常！原因是：{}",ex.toString());
        return ResultResponse.error(ex);
    }

    @ExceptionHandler(value = BizException.class)
    public ResultResponse bizExceptionHandler(BizException ex, HttpServletRequest request){
        LOGGER.error("发生业务异常！原因是：{}",ex.toString());
        return ResultResponse.error(ex);
    }
}
