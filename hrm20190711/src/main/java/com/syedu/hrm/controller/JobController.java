package com.syedu.hrm.controller;

import com.syedu.hrm.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JobController {

    @Autowired
    private JobService jobService;

    ///job/loadJobAjax
    @RequestMapping("/job/loadJobAjax")
    @ResponseBody
    public String loadJobAjax(){

        return jobService.loadJobAjax();
    }




}
