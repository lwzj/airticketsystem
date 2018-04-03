package com.ats.service;

import com.ats.bean.Order;

import java.util.List;
import java.util.Map;

public interface IOrderService {
    List<Order> findById(Map<String, Object> param);

    Integer add(Map<String, Object> param);

    void update(Map<String, Object> param);
}
