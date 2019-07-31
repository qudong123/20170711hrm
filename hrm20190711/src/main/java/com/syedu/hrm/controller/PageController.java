package com.syedu.hrm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    //通用的页面处理Controller
    @RequestMapping("/{page}")
    public String page(@PathVariable String page) {
        return page;
    }
}
