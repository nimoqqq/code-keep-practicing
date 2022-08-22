package com.nimo.rabbitMQ.util;

import org.jasypt.encryption.pbe.PooledPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.SimpleStringPBEConfig;
/**
 * @author : chuf
 * @date : 2022-07-19
 **/

public class JasyptUtil {

    /**
     * Jasypt生成加密结果
     * @param password 配置文件中设定的加密盐值
     * @param value 加密值
     * @return
     */
    public static String encyptPwd(String password,String value){
        PooledPBEStringEncryptor encryptor = new PooledPBEStringEncryptor();
        encryptor.setConfig(cryptor(password));
        String result = encryptor.encrypt(value);
        return result;
    }

    /**
     * 解密
     * @param password 配置文件中设定的加密盐值
     * @param value 解密密文
     * @return
     */
    public static String decyptPwd(String password,String value){
        PooledPBEStringEncryptor encryptor = new PooledPBEStringEncryptor();
        encryptor.setConfig(cryptor(password));
        String result = encryptor.decrypt(value);
        return result;
    }

    public static SimpleStringPBEConfig cryptor(String password){
        SimpleStringPBEConfig config = new SimpleStringPBEConfig();
        config.setPassword(password);
        config.setAlgorithm("PBEWithMD5AndDES");
        config.setKeyObtentionIterations("1000");
        config.setPoolSize("1");
        config.setProviderName("SunJCE");
        config.setSaltGeneratorClassName("org.jasypt.salt.RandomSaltGenerator");
        config.setStringOutputType("base64");
        return config;
    }


    public static void main(String[] args) {
        // 加密
        String encPwd = encyptPwd("aec157fa902447d592d91rb40364cb2e", "1234Qwermq");
        // 解密
        String decPwd = decyptPwd("aec157fa902447d592d91rb40364cb2e", encPwd);
        System.out.println(encPwd);
        System.out.println(decPwd);
    }
}

