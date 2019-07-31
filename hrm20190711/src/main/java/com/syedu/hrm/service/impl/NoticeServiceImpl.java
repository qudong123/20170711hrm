package com.syedu.hrm.service.impl;

import com.syedu.hrm.bean.Notice;
import com.syedu.hrm.dao.NoticeMapper;
import com.syedu.hrm.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public void saveNotice(Notice notice) {

        noticeMapper.save(notice);
    }



    @Override
    public List<Notice> findAll() {
        List<Notice> notices = noticeMapper.find(null);
        return notices;
    }

    @Override
    public Notice get(int id) {
        return noticeMapper.get(id);
    }

    @Override
    public void updateNotice(Notice notice) {
        noticeMapper.update(notice);
    }


}
