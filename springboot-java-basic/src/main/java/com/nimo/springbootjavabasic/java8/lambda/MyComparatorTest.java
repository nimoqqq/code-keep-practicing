package com.nimo.springbootjavabasic.java8.lambda;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @program: code-keep-practicing
 * @ClassName: MyComparatorTest
 * @description:
 * @author: chuf
 * @create: 2022-03-11 13:52
 * <p>
 * 这里o1表示位于前面的对象，o2表示后面的对象
 * <p>
 * 返回-1（或负数），表示不需要交换01和02的位置，o1排在o2前面，asc
 * 返回1（或正数），表示需要交换01和02的位置，o1排在o2后面，desc
 **/
public class MyComparatorTest {

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("20");
        list.add("21");
        list.add("50");
        list.add("5");
        list.add("23");
        list.add("4");
        list.add("6");
        list.add("5");
        Collections.sort(list, comparator);
        System.out.println(list);
        list.forEach(System.out::println);
    }

    private static Comparator<String> comparator = (o1, o2) -> {
        int num1 = Integer.parseInt(o1);
        int num2 = Integer.parseInt(o2);
        if (num1 > num2) {
            return -1;
        } else if (num1 < num2) {
            return 1;
        }
        return 0;
    };
}
