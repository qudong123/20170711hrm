package com.syedu.hrm.controller;


import com.syedu.hrm.bean.Dept;
import com.syedu.hrm.bean.Employee;
import com.syedu.hrm.service.DeptService;
import com.syedu.hrm.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class EmpController {

    @Autowired
    private DeptService deptService;

    @Autowired
    private EmpService empService;


    @RequestMapping("emp/toAddEmp")
    public String toAddEmp(Model model){

        List<Dept> depts=deptService.getDepts();
        model.addAttribute("depts",depts);

        return "emp/addEmp";
    }

    //保存员工/employee/addEmp

    @RequestMapping("employee/addEmp")
    public  void addEmp(Employee employee, HttpServletResponse response) throws  Exception {

        empService.addEmp(employee);

        response.sendRedirect("/emp/empList");

    }

    @RequestMapping("/emp/empList")
    public String  addEmp(Model model) throws  Exception {
     return "emp/empList";
    }




}
