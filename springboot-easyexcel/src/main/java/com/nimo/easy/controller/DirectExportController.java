package com.nimo.easy.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.write.metadata.WriteSheet;
import com.alibaba.excel.write.metadata.WriteTable;
import com.nimo.easy.dto.ExcelData;
import com.nimo.easy.dto.FillData;
import com.nimo.easy.utils.TestFileUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * @program: code-keep-practicing
 * @ClassName: DirectExport
 * @description:
 * @author: chuf
 * @create: 2022-03-28 09:40
 **/
@RestController
@Slf4j
public class DirectExportController {


    @ResponseBody
    @GetMapping(value = "/test")
    public void unDirectExport(HttpServletResponse response, Integer id) throws Exception {

        String fileName = "test2.zip";
        response.setCharacterEncoding("utf-8");
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
        response.setHeader("Content-Disposition", "attachment;filename*=UTF-8''" + URLEncoder.encode(fileName, "UTF-8"));
        Map<String, ExcelData> map = get47Time();

        exportExcel(response, map);

    }

    private void exportExcel(HttpServletResponse response, Map<String, ExcelData> map) throws IOException {
        ServletOutputStream outputStream = response.getOutputStream();
        ZipOutputStream zipOutputStream = new ZipOutputStream(outputStream);
        // ???????????? ???{} ??????????????????????????? ??????????????????"{","}" ???????????? ???"\{","\}"??????
        String templateFileName =
                "/Users/chuf/workingSoftware/code-keep-practicing/springboot-easyexcel/src/main/resources/???????????????-?????????????????????.xlsx";
        try {
            for (Map.Entry<String, ExcelData> entry : map.entrySet()) {
                String k = entry.getKey();
                ExcelData value = entry.getValue();

                // ??????????????????
                String fileName = System.currentTimeMillis() + ".xlsx";

                ExcelWriter excelWriter = EasyExcel.write(fileName).withTemplate(templateFileName).build();
                WriteSheet writeSheet = EasyExcel.writerSheet().build();
                excelWriter.fill(value, writeSheet);

                //??????????????????
                ZipEntry zipEntry = new ZipEntry(fileName);
                zipOutputStream.putNextEntry(zipEntry);
                Workbook workbook = excelWriter.writeContext().writeWorkbookHolder().getWorkbook();
                //???excel????????????????????????????????????
                workbook.write(zipOutputStream);
            }
            zipOutputStream.flush();
        } catch (Exception e) {
            log.error("???XXX??????,??????" + e.getMessage());
            log.error(e.getMessage(), e);
            //????????????????????????
            throw new IOException();
        } finally {
            //???????????????????????????????????????
            zipOutputStream.close();
            outputStream.close();
        }
    }

    private Map<String, ExcelData> get47Time() {
        Map<String, ExcelData> res = new HashMap<>(47);
        LocalDate localDate = LocalDate.now();
        LocalDateTime now = LocalDateTime.of(localDate.getYear(), localDate.getMonth(), localDate.getDayOfMonth(), 0, 0);
        for (int i = 1; i < 47; i++) {
            ExcelData a = new ExcelData();
            String format = now.plusMinutes(15 * i).format(DateTimeFormatter.ofPattern("HH:mm"));
            a.setName(format);
            a.setNumber(i);
            a.setDate(now);
            a.setAge(i);
            res.put(format, a);
        }
        return res;
    }


    /**
     * ???????????????
     */
    @ResponseBody
    @GetMapping(value = "/simpleFill")
    public void simpleFill(HttpServletResponse response) throws IOException {
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");

        // ???????????? ???{} ??????????????????????????? ??????????????????"{","}" ???????????? ???"\{","\}"??????
        String templateFileName =
                "/Users/chuf/workingSoftware/code-keep-practicing/springboot-easyexcel/src/main/resources/???????????????-?????????????????????.xlsx";

        // ??????????????????
        String fileName = System.currentTimeMillis() + ".xlsx";
        response.setHeader("Content-disposition", "attachment;filename=" + fileName);
        // ?????? ?????????????????????sheet??? ??????????????????????????????
        FillData fillData = new FillData();
        fillData.setName("??????");
        fillData.setNumber(5.2);
        EasyExcel.write(response.getOutputStream()).withTemplate(templateFileName).sheet().doFill(fillData);
    }
}
