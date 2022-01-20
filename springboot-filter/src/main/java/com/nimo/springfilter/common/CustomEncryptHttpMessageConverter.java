package com.nimo.springfilter.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimo.springfilter.model.EncryptModel;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.util.StreamUtils;

import java.io.IOException;
import java.lang.reflect.Type;

@RequiredArgsConstructor
public class CustomEncryptHttpMessageConverter extends MappingJackson2HttpMessageConverter {

    private final ObjectMapper objectMapper;


    @Override
    protected Object readInternal(Class<?> clazz, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        if (Encryptable.class.isAssignableFrom(clazz)) {
            EncryptModel in = objectMapper.readValue(StreamUtils.copyToByteArray(inputMessage.getBody()), EncryptModel.class);
            String inRawSign = String.format("data=%s&timestamp=%d", in.getData(), in.getTimestamp());
            String inSign;
            try {
                inSign = EncryptUtils.getSingleton().sha(inRawSign);
            } catch (Exception e) {
                throw new IllegalArgumentException("验证参数签名失败!");
            }
            if (!inSign.equals(in.getSign())) {
                throw new IllegalArgumentException("验证参数签名失败!");
            }
            try {
                return objectMapper.readValue(EncryptUtils.getSingleton().decryptByAes((String) in.getData()), clazz);
            } catch (Exception e) {
                throw new IllegalArgumentException("解密失败!");
            }
        } else {
            return super.readInternal(clazz, inputMessage);
        }
    }

    @Override
    protected void writeInternal(Object object, Type type, HttpOutputMessage outputMessage)
            throws IOException, HttpMessageNotWritableException {
        Class<?> clazz = (Class) type;
        if (Encryptable.class.isAssignableFrom(clazz)) {
            EncryptModel out = new EncryptModel();
            out.setTimestamp(System.currentTimeMillis());
            try {
                out.setData(EncryptUtils.getSingleton().encryptByAes(objectMapper.writeValueAsString(object)));
                String rawSign = String.format("data=%s&timestamp=%d", out.getData(), out.getTimestamp());
                out.setSign(EncryptUtils.getSingleton().sha(rawSign));
            } catch (Exception e) {
                throw new IllegalArgumentException("参数签名失败!");
            }
            super.writeInternal(out, type, outputMessage);
        } else {
            super.writeInternal(object, type, outputMessage);
        }
    }
}
