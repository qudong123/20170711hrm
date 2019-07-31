package com.syedu.hrm.controller;

import com.sun.deploy.net.HttpResponse;
import com.syedu.hrm.bean.Notice;
import com.syedu.hrm.bean.User;
import com.syedu.hrm.constant.WebConstant;
import com.syedu.hrm.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    ///notice/toAddNotice
   /*去添加公告*/
    @RequestMapping("notice/toAddNotice")
    public String toAddNotice(){
        return "notice/addNotice";
    }

    /*添加公告*/
    @RequestMapping("/notice/addNotice")
    public String addNotice(Notice notice, HttpServletRequest request){
        //调用service把notice保存到表中
       User user=(User)request.getSession().getAttribute(WebConstant.SESSION_USER);
       notice.setUser(user);
       noticeService.saveNotice(notice);

        return "notice/addNotice";

    }

    //查询公告  /notice/noticeList

    @RequestMapping("/notice/noticeList")
    public String noticeList(Model model){
        //查询数据
        List<Notice> notices= noticeService.findAll();
        model.addAttribute("notices",notices);

        return "notice/noticeList";

    }

    // 去更新
    @RequestMapping("/notice/toUpdateNotice")
    public  String toUpdateNotice(int id,Model model){

         Notice notice= noticeService.get(id);
         model.addAttribute("notice",notice);
         return "notice/updateNotice";
    }

    //更新
    @RequestMapping("/notice/updateNotice")
    public void  updateNotice(Notice notice, HttpServletResponse response) throws  Exception {

         noticeService.updateNotice(notice);

        response.sendRedirect("/notice/noticeList");
    }




}
