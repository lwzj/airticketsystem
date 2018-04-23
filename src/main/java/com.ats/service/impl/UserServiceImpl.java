package com.ats.service.impl;

import com.ats.bean.User;
import com.ats.dao.IUserDao;
import com.ats.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;
    public List<User> getUser(Map<String, Object> param) {
        List<User> users = userDao.getUser(param);
        return users;
    }

    public void addUser(Map<String, Object> param) {
        userDao.addUser(param);
    }
}
