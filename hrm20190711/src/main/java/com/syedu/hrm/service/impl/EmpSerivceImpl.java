package com.syedu.hrm.service.impl;

import com.syedu.hrm.bean.Employee;
import com.syedu.hrm.dao.EmployeeMapper;
import com.syedu.hrm.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmpSerivceImpl implements EmpService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public void addEmp(Employee employee) {

        employeeMapper.save(employee);
    }
}
