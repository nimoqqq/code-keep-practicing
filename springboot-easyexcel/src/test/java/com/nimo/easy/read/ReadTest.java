package com.nimo.easy.read;

import com.alibaba.excel.EasyExcel;
import com.nimo.easy.read.DemoData;
import com.nimo.easy.read.DemoDataListener;
import com.nimo.easy.utils.TestFileUtil;
import org.junit.jupiter.api.Test;

import java.io.File;

/**
 * @program: code-keep-practicing
 * @ClassName: ReadTest
 * @description: 读的常见写法
 * @author: chuf
 * @create: 2022-03-27 23:24
 **/
public class ReadTest {

    /**
     * 最简单的读
     * <p>1. 创建excel对应的实体对象 参照{@link DemoData}
     * <p>2. 由于默认一行行的读取excel，所以需要创建excel一行一行的回调监听器，参照{@link DemoDataListener}
     * <p>3. 直接读即可
     */
    @Test
    public void simpleRead() {
        String fileName = TestFileUtil.getPath() + "demo" + File.separator + "demo.xlsx";
        // 这里 需要指定读用哪个class去读，然后读取第一个sheet 文件流会自动关闭
        EasyExcel.read(fileName, DemoData.class, new DemoDataListener()).sheet().doRead();
    }
}
