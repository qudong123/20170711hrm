package com.syedu.hrm.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.syedu.hrm.bean.Job;
import com.syedu.hrm.dao.JobMapper;
import com.syedu.hrm.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImpl implements JobService {

    @Autowired
    private JobMapper jobMapper;

    @Override
    public String loadJobAjax() {

        List<Job> jobs = jobMapper.find(null);
        JSONArray jsonArray = new JSONArray();
        for(Job job:jobs){
            JSONObject jsonObject =new JSONObject();
            jsonObject.put("id",job.getId());
            jsonObject.put("name",job.getName());
            jsonArray.add(jsonObject);
        }

        return jsonArray.toString();
    }
}
