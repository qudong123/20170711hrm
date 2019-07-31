package com.syedu.hrm.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.UUID;

@Controller
public class UploadPicAjaxController {

    //

    @RequestMapping("/notice/uploadPic")
    @ResponseBody
    public String getImgURL(MultipartFile file , HttpServletRequest request, HttpServletResponse response) throws  Exception{

        //获取需要服务器端存放文件的位置
        String realPath = request.getServletContext().getRealPath("/images/notice/");
        //为用户上传的文件在服务器端生成一个文件名
        String newFileName = UUID.randomUUID().toString() + file.getOriginalFilename();
        //把需要上传的文件cope到目的地
        file.transferTo(new File(realPath+newFileName));
        return "/images/notice/"+newFileName;

    }


}
