package com.ats.service.impl;

import com.ats.bean.Flight;
import com.ats.dao.IFlightDao;
import com.ats.service.IFlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("flightService")
public class FlightServiceImpl implements IFlightService {
    @Autowired
    private IFlightDao flightDao;
    public List<Flight> findById(Map<String, Object> param) {
        List<Flight> flights = flightDao.findById(param);
        return flights;
    }

    public int add(Map<String, Object> param) {
        int m = flightDao.add(param);
        return m;
    }
}
