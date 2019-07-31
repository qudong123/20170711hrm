package com.syedu.hrm.base;

import com.syedu.hrm.bean.User;
import com.syedu.hrm.constant.WebConstant;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //该方法会被执行
        // 用户登录成功之后把用户登录的信息放入到session中，然后在在这里从session中取出用户信息，如果为空则认为该用户没有登录
        // 1 判断用户是否登录，如果登录跳转到main
        User user = (User) request.getSession().getAttribute(WebConstant.SESSION_USER);
        // 2 如果没有登录跳转到login
        if (user != null) {
            return true;
        }

        response.sendRedirect("/tologin");
        return false;

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion");
    }
}
