package com.syedu.hrm.service;

import com.syedu.hrm.bean.Notice;

import java.util.List;

public interface NoticeService {


    void saveNotice(Notice notice);

     List<Notice> findAll();

      Notice get(int id);

    void updateNotice(Notice notice);
}
