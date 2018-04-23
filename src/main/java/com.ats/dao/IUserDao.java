package com.ats.dao;

import com.ats.bean.User;

import java.util.List;
import java.util.Map;

public interface IUserDao {
    List<User> getUser(Map<String, Object> param);

    void addUser(Map<String, Object> param);
}
