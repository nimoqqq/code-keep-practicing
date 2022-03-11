package com.nimo.springbootjavabasic.java8.streamDemo;

import java.util.Arrays;
import java.util.IntSummaryStatistics;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @program: code-keep-practicing
 * @ClassName: StreamTest
 * @description:
 * @author: chuf
 * @create: 2022-03-11 14:43
 **/
public class StreamTest {

    public static void main(String[] args) {
        List<String> strings = Arrays.asList("abc", "def", "gkh", "abc");
        // 返回符合条件的stream
        final Stream<String> stringStream = strings.stream().filter("abc"::equals);
        // 返回总条数
        final long count = stringStream.count();
        // foreach 遍历
        strings.forEach(System.out::println);
        // 获取指定元素的 stream
        final Stream<String> limit = strings.stream().limit(2);
        final Stream<String> stringStream1 = strings.stream().map(s -> s + "~");

        //sorted 排序并打印
        strings.stream().sorted().forEach(System.out::println);

        //Collectors collect 把abc放入容器中
        List<String> collect = strings.stream().filter(string -> "abc".equals(string)).collect(Collectors.toList());
        //把list转为string，各元素用，号隔开
        String mergedString = strings.stream().filter(string -> !string.isEmpty()).collect(Collectors.joining(","));

        //对数组的统计，比如用
        List<Integer> number = Arrays.asList(1, 2, 5, 4);

        IntSummaryStatistics statistics = number.stream().mapToInt((x) -> x).summaryStatistics();
        System.out.println("列表中最大的数 : " + statistics.getMax());
        System.out.println("列表中最小的数 : " + statistics.getMin());
        System.out.println("平均数 : " + statistics.getAverage());
        System.out.println("所有数之和 : " + statistics.getSum());

        //concat 合并流
        List<String> strings2 = Arrays.asList("xyz", "jqx");
        Stream.concat(strings2.stream(), strings.stream()).count();

        //注意 一个Stream只能操作一次，不能断开，否则会报错。
        Stream stream = strings.stream();
        //第一次使用
        stream.limit(2);
        //第二次使用
        stream.forEach(System.out::println);
        //报错 java.lang.IllegalStateException: stream has already been operated upon or closed

        //但是可以这样, 连续使用
        stream.limit(2).forEach(System.out::println);
    }
}
