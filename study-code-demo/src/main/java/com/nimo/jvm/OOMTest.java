package com.nimo.jvm;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @author : chuf
 * @date : 2022-09-07
 **/
public class OOMTest {
    public static List<Object> list = new ArrayList<>();

    public static void main(String[] args) {
        int i = 0;
        int j = 0;

        while (true) {
            list.add(new User(i++, UUID.randomUUID().toString(), 1));
            new User(j--, UUID.randomUUID().toString(), 1);
        }
    }
}
