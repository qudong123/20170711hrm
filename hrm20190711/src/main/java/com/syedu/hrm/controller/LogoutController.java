package com.syedu.hrm.controller;

import com.alibaba.fastjson.JSONObject;
import com.syedu.hrm.bean.User;
import com.syedu.hrm.constant.WebConstant;
import com.syedu.hrm.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LogoutController {


    @RequestMapping("/logout")
    public void  loginAjax(HttpServletRequest request, HttpServletResponse response) throws  Exception {
        //清空session
        request.getSession().invalidate();

        //重定向到登录页面
        response.sendRedirect("/tologin");


    }

}
