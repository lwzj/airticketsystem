package com.ats.service;

import com.ats.bean.Admin;

import java.util.List;
import java.util.Map;

public interface IAdminService {
    List<Admin> getUser(Map<String, Object> param);
}
