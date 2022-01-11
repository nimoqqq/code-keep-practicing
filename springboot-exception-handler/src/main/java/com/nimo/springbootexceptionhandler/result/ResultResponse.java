package com.nimo.springbootexceptionhandler.result;

import com.nimo.springbootexceptionhandler.exception.BaseException;
import org.springframework.http.HttpStatus;
import org.springframework.util.ObjectUtils;

/**
 * @program: code-keep-practicing
 * @ClassName: ResultResponse
 * @description: 结果对象
 * @author: chuf
 * @create: 2022-01-11 16:03
 **/
public class ResultResponse {

    /**
     * 响应code
     */
    private int code;

    /**
     * 响应消息
     */
    private String message;

    /**
     * 响应结果
     */
    private Object result;

    public ResultResponse() {

    }

    public ResultResponse(BaseException ex) {
        this.code = ex.getError().getCode();
        this.message = ex.getError().getMessage();
        if (!ObjectUtils.isEmpty(ex.getData())) {
            this.setResult(ex.getData());
        }
    }

    /**
     * 成功
     *
     * @return
     */
    public static ResultResponse success() {
        return success(null);
    }

    /**
     * 成功
     * @param data
     * @return
     */
    public static ResultResponse success(Object data) {
        ResultResponse result = new ResultResponse();
        result.setCode(1);
        result.setMessage(HttpStatus.OK.getReasonPhrase());
        result.setResult(data);
        return result;
    }

    /**
     * 失败
     * @param ex
     * @return
     */
    public static ResultResponse error(BaseException ex) {
        return new ResultResponse(ex);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}
