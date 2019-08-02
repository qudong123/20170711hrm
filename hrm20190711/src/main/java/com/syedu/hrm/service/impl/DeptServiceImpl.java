package com.syedu.hrm.service.impl;

import com.syedu.hrm.bean.Dept;
import com.syedu.hrm.dao.DeptMapper;
import com.syedu.hrm.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;


    @Override
    public List<Dept> getDepts() {

        return deptMapper.find(null);
    }
}
