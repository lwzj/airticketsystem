package com.ats.service.impl;

import com.ats.bean.Order;
import com.ats.dao.IOrderDao;
import com.ats.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("orderService")
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private IOrderDao orderDao;
    public List<Order> findById(Map<String, Object> param) {
        List<Order> orders = orderDao.findById(param);
        return orders;
    }

    public synchronized  Integer add(Map<String, Object> param) {

        return null;
    }

    public void update(Map<String, Object> param) {
        orderDao.update(param);
    }
}
