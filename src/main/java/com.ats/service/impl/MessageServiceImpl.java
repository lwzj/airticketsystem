package com.ats.service.impl;

import com.ats.dao.IMessageDao;
import com.ats.service.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("messageService")
public class MessageServiceImpl implements IMessageService {
    @Autowired
    private IMessageDao messageDao;
    public int add(Map<String, Object> param) {
        int m = messageDao.add(param);
        return m;
    }
}
