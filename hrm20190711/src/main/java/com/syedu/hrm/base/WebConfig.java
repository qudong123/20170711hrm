package com.syedu.hrm.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
   private LoginInterceptor loginInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //告诉登录拦截器哪些需要拦截，哪些不需要拦截

        //addPathPatterns() 哪些url需要拦截
        //excludePathPatterns()
        String[] addPathPatterns={"/**"};
        String[] excludePathPatterns={"/tologin","/css/**","/images/**","/js/**","/loginAjax","/verifycode"};
        registry.addInterceptor(loginInterceptor).addPathPatterns(addPathPatterns).excludePathPatterns(excludePathPatterns);

    }
}
