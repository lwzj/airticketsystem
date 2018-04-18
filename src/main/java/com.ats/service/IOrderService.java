package com.ats.service;

import com.ats.bean.Order;
import com.ats.dto.OrderDto;

import java.util.List;
import java.util.Map;

public interface IOrderService {
    List<Order> findById(Map<String, Object> param);
    List<Order> findByOrderNum(Map<String, Object> param);

    boolean add(List<OrderDto> orderDtos,String orderNum);

    void update(Map<String, Object> param);
}
