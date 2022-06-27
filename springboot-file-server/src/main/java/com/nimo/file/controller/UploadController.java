package com.nimo.file.controller;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;

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
        response.setCharacterEncoding(utf8);

        // 当前分片
        Integer chunk = null;
        // 分片总数
        Integer chunks = null;
        String name = null;
        // 本地存储路径
        String uploadPath = "/Users/chuf/Downloads/webuploader_demo-master";
        // 缓存流
        BufferedOutputStream os = null;

        try {
            // 文件缓存
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(1024);
            factory.setRepository(new File(uploadPath));
            //解析 request
            ServletFileUpload fileUpload = new ServletFileUpload();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try{
                if(os != null){
                    os.close();
                }
            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }
}
