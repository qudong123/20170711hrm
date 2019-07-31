package com.syedu.hrm.service.impl;

import com.syedu.hrm.bean.User;
import com.syedu.hrm.dao.UserMapper;
import com.syedu.hrm.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findByNameAndPwd(String userId, String password) {
        User user = userMapper.findByNameAndPwd(userId, password);
        return user;
    }
}
