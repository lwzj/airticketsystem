package com.ats.dao;

import com.ats.bean.Flight;

import java.util.List;
import java.util.Map;

public interface IFlightDao {
    List<Flight> findById(Map<String, Object> param);

    List<Flight> queryByFlightId(Map<String, Object> param);

    int addFlight(Map<String, Object> param);

    int queryNum(Map<String, Object> param);

    void updateFlight(Map<String, Object> param);


}
