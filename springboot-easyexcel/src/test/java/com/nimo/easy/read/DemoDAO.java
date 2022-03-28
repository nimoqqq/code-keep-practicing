package com.nimo.easy.read;

import java.util.List;

/**
 * @program: code-keep-practicing
 * @ClassName: DemoDAO
 * @description:
 * @author: chuf
 * @create: 2022-03-27 23:38
 **/
public class DemoDAO {

    public void save(List<DemoData> list) {
        // 如果是mybatis,尽量别直接调用多次insert,自己写一个mapper里面新增一个方法batchInsert,所有数据一次性插入
    }
}
