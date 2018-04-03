package com.ats.service;

import com.ats.bean.User;

import java.util.List;
import java.util.Map;

public interface IUserService {
    List<User> getUser(Map<String, Object> param);
}
