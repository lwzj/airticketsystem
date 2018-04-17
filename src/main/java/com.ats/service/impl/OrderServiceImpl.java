package com.ats.service.impl;

import com.ats.bean.Flight;
import com.ats.bean.Order;
import com.ats.dao.IFlightDao;
import com.ats.dao.IOrderDao;
import com.ats.dto.OrderDto;
import com.ats.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("orderService")
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private IOrderDao orderDao;
    @Autowired
    private IFlightDao flightDao;

    public List<Order> findById(Map<String, Object> param) {
        List<Order> orders = orderDao.findById(param);
        return orders;
    }

    public synchronized boolean add(List<OrderDto> orderDtos) {
        Map<String, Object> p = new HashMap<String, Object>();
        p.put("id", orderDtos.get(0).getFlightId());
        int num = flightDao.queryNum(p);
        if (num < orderDtos.size()) {
            return false;
        }
        for (OrderDto order : orderDtos) {
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("flightId", order.getFlightId());
            param.put("username", order.getUsername());
            param.put("IDcard", order.getIDcard());
            orderDao.addOrder(param);
            num--;
        }
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("num", num);
        param.put("id", orderDtos.get(0).getFlightId());
        flightDao.updateFlight(param);
        return true;
    }


    public void update(Map<String, Object> param) {
        orderDao.update(param);
    }
}
