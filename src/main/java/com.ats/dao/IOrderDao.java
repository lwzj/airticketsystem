package com.ats.dao;

import com.ats.bean.Order;

import java.util.List;
import java.util.Map;

public interface IOrderDao {
    List<Order> findById(Map<String, Object> param);
    List<Order> findByOrderNum(Map<String, Object> param);

    void updateOrder(Map<String, Object> param);

    void addOrder(Map<String, Object> param);
}
