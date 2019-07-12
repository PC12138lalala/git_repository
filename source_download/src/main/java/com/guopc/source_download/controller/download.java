package com.guopc.source_download.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.ResourceBundle;

@Controller()
public class download {
    @RequestMapping("{name}")
    public String toDownload(@PathVariable("name") String name,
                             HttpServletRequest request,
                             HttpServletResponse response) {
        String fileName = name;
        System.out.println(fileName);
        try {
            fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        ResourceBundle res = ResourceBundle.getBundle("webapp");
        String path = res.getString("VIDEOPATH") +
                "\\";
        System.out.println(path);
        // 得到要下载的文件
        File file = new File(path, fileName);
        System.out.println(path + fileName);
        // 如果文件不存在
        if (!file.exists()) {
            System.out.println(1);
            return "";
        }
        // 设置响应头，控制浏览器下载该文件
        try {
            response.setHeader("content-disposition", "attachment;filename="
                    + URLEncoder.encode(fileName, "UTF-8"));
            // 读取要下载的文件，保存到文件输入流
            FileInputStream in = new FileInputStream(path + "\\" + fileName);
            // 创建输出流
            OutputStream out = response.getOutputStream();
            // 创建缓冲区
            byte buffer[] = new byte[1024 * 1024 * 1024];
            int len = 0;
            // 循环将输入流中的内容读取到缓冲区当中
            while ((len = in.read(buffer)) > 0) {
                // 输出缓冲区的内容到浏览器，实现文件下载
                out.write(buffer, 0, len);
                // 关闭文件输入流
                in.close();
                // 关闭输出流
                out.close();
            }
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "";
    }
}
