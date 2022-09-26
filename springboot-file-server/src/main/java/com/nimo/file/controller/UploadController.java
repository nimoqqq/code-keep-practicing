package com.nimo.file.controller;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

/**
 * @author : chuf
 * @date : 2022-06-27
 **/
@Controller
public class UploadController {

    private static final String utf8 = "utf-8";

    @RequestMapping("/upload")
    @ResponseBody
    public void upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("执行。。。。。。");
        response.setCharacterEncoding(utf8);

        // 当前分片
        Integer chunk = null;
        // 分片总数
        Integer chunks = null;
        // 文件名
        String name = null;
        // 本地存储路径
        String uploadPath = "/Users/chuf/Downloads/webuploader_demo-master";
        // 缓存流
        BufferedOutputStream os = null;

        try {
            //设置缓冲区大小  先读到内存里在从内存写
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(1024);
            factory.setRepository(new File(uploadPath));
            //解析 request
            ServletFileUpload fileUpload = new ServletFileUpload(factory);
            // 文件大小
            fileUpload.setFileSizeMax(5L * 1024L * 1024L * 1024L);
            // 总大小
            fileUpload.setSizeMax(10L * 1024L * 1024L * 1024L);
            List<FileItem> fileItems = fileUpload.parseRequest(request);
            for (FileItem item : fileItems) {
                if (item.isFormField()) {
                    if (Objects.equals("chunk", item.getFieldName())) {
                        chunk = Integer.parseInt(item.getString(utf8));
                    }
                    if (Objects.equals("chunks", item.getFieldName())) {
                        chunks = Integer.parseInt(item.getString(utf8));
                    }
                    if (Objects.equals("name", item.getFieldName())) {
                        name = item.getString(utf8);
                    }
                }
            }
            // 获取文件基本信息后
            for (FileItem item : fileItems) {
                if (!item.isFormField()) {
                    // 临时目录
                    String temFileName = name;
                    if (name != null) {
                        if (chunk != null) {
                            if (chunk != null) {
                                temFileName = chunk + "_" + name;
                            }
                        }
                    }
                    //判断文件是否存在
                    File temfile = new File(uploadPath, temFileName);
                    // 断点续传,判段文件是否存在,若存在则不传
                    if (!temfile.exists()) {
                        item.write(temfile);
                    }
                }
            }
            //文件合并  当前分片为最后一个就合并
            if (chunk != null && Objects.equals(chunk.intValue(), chunks.intValue() - 1)) {
                File tempFile = new File(uploadPath, name);
                os = new BufferedOutputStream(new FileOutputStream(tempFile));
                //根据之前命名规则找到所有分片
                for (int i = 0; i < chunks; i++) {
                    File file = new File(uploadPath, i + "_" + name);
                    //并发情况 需要判断所有  因为可能最后一个分片传完，之前有的还没传完
                    while (!file.exists()) {
                        //不存在休眠100毫秒后在从新判断
                        Thread.sleep(100);
                    }
                    //分片存在  读入数组中
                    byte[] bytes = FileUtils.readFileToByteArray(file);
                    os.write(bytes);
                    os.flush();
                    file.delete();
                }
                os.flush();
            }
            response.getWriter().write("上传成功");
        } finally {
            try {
                if (os != null) {
                    os.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
