package com.ats.service;

import com.ats.bean.Flight;

import java.util.List;
import java.util.Map;

public interface IFlightService {
    List<Flight> findById(Map<String, Object> param);

    int add(Map<String, Object> param);
}
