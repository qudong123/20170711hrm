package com.syedu.hrm.service;

import com.syedu.hrm.bean.User;

public interface LoginService {


    User findByNameAndPwd(String userId, String password);
}
