package com.ats.dao;

import com.ats.bean.Message;

import java.util.List;
import java.util.Map;

public interface IMessageDao {
    void addMessage(Map<String, Object> param);

    List<Message> queryAll();
}
