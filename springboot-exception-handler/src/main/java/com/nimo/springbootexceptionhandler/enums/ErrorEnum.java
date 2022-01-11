package com.nimo.springbootexceptionhandler.enums;

import org.springframework.http.HttpStatus;

/**
 * @program: code-keep-practicing
 * @ClassName: ErrorEnum
 * @description: 全局异常
 * @author: chuf
 * @create: 2022-01-11 16:00
 **/
public enum ErrorEnum {

    BODY_NOT_MATCH(400, HttpStatus.BAD_REQUEST, "请求的数据格式不符!"),

    SIGNATURE_NOT_MATCH(401, HttpStatus.UNAUTHORIZED, "请求的数字签名不匹配!"),

    NOT_FOUND(404, HttpStatus.NOT_FOUND, "未找到该资源!"),

    INTERNAL_SERVER_ERROR(500, HttpStatus.INTERNAL_SERVER_ERROR, "服务器内部错误!"),

    SERVER_BUSY(503, HttpStatus.SERVICE_UNAVAILABLE, "服务器正忙，请稍后再试!");

    ErrorEnum(int code, HttpStatus status, String message) {
        this.code = code;
        this.status = status;
        this.message = message;
    }

    private int code;

    private HttpStatus status;

    private String message;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public HttpStatus getStatus() {
        return status;
    }

    public void setStatus(HttpStatus status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "ErrorEnum{" +
                "code=" + code +
                ", status=" + status +
                ", message='" + message + '\'' +
                '}';
    }
}
