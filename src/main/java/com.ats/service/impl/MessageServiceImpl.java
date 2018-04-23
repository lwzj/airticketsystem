package com.ats.service.impl;

import com.ats.bean.Message;
import com.ats.dao.IMessageDao;
import com.ats.service.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("messageService")
public class MessageServiceImpl implements IMessageService {
    @Autowired
    private IMessageDao messageDao;
    public void addM(Map<String, Object> param) {
        messageDao.addMessage(param);
    }

    public List<Message> queryAll() {
        return messageDao.queryAll();
    }
}
