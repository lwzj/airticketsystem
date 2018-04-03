package com.ats.dao;

import com.ats.bean.Admin;

import java.util.List;
import java.util.Map;

public interface IAdminDao {
    List<Admin> getAdmin(Map<String, Object> param);
}
