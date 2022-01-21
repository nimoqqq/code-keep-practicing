package com.nimo.springfilter.common;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: code-keep-practicing
 * @ClassName: CustomEncryptHttpWrapper
 * @description: 重写 request
 * @author: chuf
 * @create: 2022-01-19 23:45
 **/
public class CustomEncryptHttpWrapper extends HttpServletRequestWrapper {

    private final Map<String, String> headers = new HashMap<>(8);
    private final byte[] data;

    public CustomEncryptHttpWrapper(HttpServletRequest request, String content) {
        super(request);
        data = content.getBytes(StandardCharsets.UTF_8);
        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String key = headerNames.nextElement();
            headers.put(key, request.getHeader(key));
        }
    }

    public void putHeader(String key, String value) {
        headers.put(key, value);
    }

    @Override
    public String getHeader(String name) {
        return headers.get(name);
    }

    @Override
    public Enumeration<String> getHeaders(String name) {
        return Collections.enumeration(Collections.singletonList(headers.get(name)));
    }

    @Override
    public Enumeration<String> getHeaderNames() {
        return  Collections.enumeration(headers.keySet());
    }

    @Override
    public ServletInputStream getInputStream() throws IOException {
        ByteArrayInputStream inputStream = new ByteArrayInputStream(data);
        return new ServletInputStream() {
            @Override
            public boolean isFinished() {
                return !isReady();
            }

            @Override
            public boolean isReady() {
                return inputStream.available() > 0;
            }

            @Override
            public void setReadListener(ReadListener listener) {

            }

            @Override
            public int read() throws IOException {
                return inputStream.read();
            }
        };
    }

    @Override
    public BufferedReader getReader() throws IOException {
        return super.getReader();
    }
}
