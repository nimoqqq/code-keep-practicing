package com.nimo.springfilter;

import com.nimo.springfilter.common.EncryptUtils;

public class Test {
    public static void main(String[] args) throws Exception {
        EncryptUtils encryptUtils = new EncryptUtils();

        String s = encryptUtils.encryptByAes("{\"orderId\":2}");
        System.out.println(s);
    }
}
