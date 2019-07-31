package com.syedu.hrm.controller;

import com.syedu.hrm.bean.Document;
import com.syedu.hrm.bean.User;
import com.syedu.hrm.constant.WebConstant;
import com.syedu.hrm.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class DocumentController {

    @Autowired
    private DocumentService documentService;

    //更新文档 1 先把需要更新的内容查询出来放到页面上  2 修改需要更新的内容
    @RequestMapping("/document/toUpdateDocument")
    public  String toUpdateDocument(String id ,Model model){
        Document document = documentService.getDocumentById(Integer.parseInt(id));
        model.addAttribute("document",document);
        return "document/updateDocument";

    }

    @RequestMapping("/document/updateDocument")
    public void updateDocument(Document document,HttpServletResponse response) throws  Exception{

        //根据id更新


        response.sendRedirect("/document/documentList");

    }



    /*文档下载*/
    @RequestMapping("/document/downDocument")
    public void downLoadDocument(String id, HttpServletRequest request,HttpServletResponse response) throws  Exception{

        Document document= documentService.getDocumentById(Integer.parseInt(id));
        String title = document.getTitle();

        //下载就是把指定的资源通过IO流响应到本地
        //D:\20190711\20190728项目\hrmcode\hrm20190711\src\main\webapp\images\document6cf340ae-a5d1-4db3-a799-6f5ae1302908Java基础方面.doc

        String filename=document.getUrl();
        //告诉浏览器本次请求响应给浏览器的是文档附件资源不是普通的页面或者其他
        response.setHeader("content-type", "application/octet-stream");
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;filename=" + filename);

        //从服务器上取响应给浏览器的文件
        //把读取到的文件响应给浏览器
        //定义缓冲数组
        byte[] buff=  new byte[1024];
        //定义输入流，用来读取服务器上资源
        BufferedInputStream bis=null;
        //输出流把输入流中的数据写出去
        OutputStream os=null;
        os = response.getOutputStream();

        //把服务器上的文件读取到IO中
        bis = new BufferedInputStream(new FileInputStream(new File(filename)));
        int i = bis.read(buff);
        //循环读取服务器上的资源
        while (i!=-1){
            os.write(buff,0,buff.length);
            os.flush();
            i=bis.read(buff);
        }
        //关闭流
        bis.close();
        os.close();

    }





    /*去添加*/
    @RequestMapping("/document/toAddDocument")
    public String toAddDocument(){

        return "document/addDocument";
    }


   /*查询文档列表*/
    @RequestMapping("/document/documentList")
    public String documentList(Model model){

        //使用documentService查询所有的文档放入到model
        List<Document> documents= documentService.findAllDocument();
        model.addAttribute("documents",documents);
        return "document/documentList";
    }

    /*添加文档的方法*/
    @RequestMapping("/document/addDocument")
    public void  addDocument(MultipartFile file, HttpServletRequest request, HttpServletResponse response, Document document) throws  Exception{

        //文件上传就是把本地选择的文件拷贝到指定的文件下面 sql.txt->  拷贝电脑上选择的资源到/images/document/
        //不能让文件重名 UUID
        String realPath = request.getServletContext().getRealPath("/images/document");
        // 生成一个新的文件名
        String newFileName= UUID.randomUUID().toString()+file.getOriginalFilename();
        //把需要上传的文件拷贝的哪里
       //D:\20190711\20190728项目\hrmcode\hrm20190711\src\main\webapp\images\document\064ebda6-aee1-4ab3-b715-10a55b70849chrm_db.sql
        file.transferTo(new File(realPath+newFileName));

        document.setUrl(realPath+newFileName);	
        document.setCreateDate(new Date());
        //获取user
        User user=  (User)request.getSession().getAttribute(WebConstant.SESSION_USER);
        document.setUser(user);
        //把记录保存到hrm_document表中
        documentService.saveDocument(document);
        response.sendRedirect("/document/documentList");
    }


}
