package com.ats.service;

import com.ats.bean.Message;

import java.util.List;
import java.util.Map;

public interface IMessageService {
    void addM(Map<String, Object> param);

    List<Message> queryAll();
}
