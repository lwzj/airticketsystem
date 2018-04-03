package com.ats.service.impl;

import com.ats.bean.Admin;
import com.ats.dao.IAdminDao;
import com.ats.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("adminService")
public class AdminServiceImpl implements IAdminService {
    @Autowired
    private IAdminDao adminDao;
    public List<Admin> getUser(Map<String, Object> param) {
        List<Admin> admins = adminDao.getAdmin(param);
        return admins;
    }
}
