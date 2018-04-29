package com.ats.controller;

import com.ats.bean.Flight;
import com.ats.bean.Order;
import com.ats.bean.User;
import com.ats.dto.OrderDto;
import com.ats.dto.OrderDto2;
import com.ats.service.IFlightService;
import com.ats.service.IMessageService;
import com.ats.service.IOrderService;
import com.ats.service.IUserService;
import com.ats.utils.JsonUtil;
import com.ats.utils.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    Logger logger = LoggerFactory.getLogger(UserController.class);
    @Autowired
    private IUserService userService;
    @Autowired
    private IMessageService messageService;
    @Autowired
    private IFlightService flightService;
    @Autowired
    private IOrderService orderService;

    /**
     * 登录
     */
    @RequestMapping("login")
    @ResponseBody
    public JSONObject login(HttpServletRequest request) {
        logger.debug("login ...");
        String data = request.getParameter("data");
        JSONObject object = new JSONObject();
        Map<String, Object> param = JsonUtil.getMapFromJson(data);
        List<User> users = userService.getUser(param);
        if (users.size() > 0) {
            object.put("code", 200);
            object.put("message", "success");
            object.put("uid", users.get(0).getId());
            object.put("username", users.get(0).getName());
            request.getSession().setAttribute("id", users.get(0).getId());
            request.getSession().setAttribute("username", users.get(0).getName());
        } else {
            object.put("code", 100);
            object.put("message", "用户名密码错误");
        }
        return object;
    }

    /**
     * 注册
     */
    @RequestMapping("register")
    @ResponseBody
    public JSONObject register(HttpServletRequest request) {
        String data = request.getParameter("data");
        JSONObject obj = new JSONObject();
        Map<String, Object> param = JsonUtil.getMapFromJson(data);
        try {
            userService.addUser(param);
            obj.put("code", 200);
        } catch (Exception e) {
            obj.put("code", 100);
        }
        return obj;
    }

    /**
     * 查询航班
     */
    @RequestMapping("queryFlightById")
    @ResponseBody
    public JSONObject queryFlight(HttpServletRequest request) {
        String data = request.getParameter("data");
        JSONObject obj = new JSONObject();
        Map<String, Object> param = JsonUtil.getMapFromJson(data);
        List<Flight> flights = flightService.findById(param);
        if (flights.size() != 0) {
            obj.put("code", 200);
            obj.put("flights", flights);
            obj.put("size", flights.size());
        } else {
            obj.put("code", 100);
            obj.put("message", "查无此航班！");
        }
        return obj;
    }

    /**
     * 订票
     */
    @RequestMapping("order")
    @ResponseBody
    public JSONObject reservation(HttpServletRequest request) {
        String data = request.getParameter("data");
        JSONArray jsonArray = JSONArray.fromObject(data);
        JSONObject obj = new JSONObject();
        List<OrderDto> orders = (List<OrderDto>) jsonArray.toCollection(jsonArray, OrderDto.class);
        String orderNum = StringUtil.getRandomString2(10);
        boolean s = orderService.add(orders, orderNum);
        if (s) {
            obj.put("code", 200);
            obj.put("message", "出票成功");
            obj.put("orderNum", orderNum);
        } else {
            obj.put("code", 100);
            obj.put("message", "出票失败,余票不足！");
        }
        return obj;
    }

    /**
     * 查询订单
     */
    @RequestMapping("queryOrderByCarId")
    @ResponseBody
    public JSONObject queryOrder(HttpServletRequest request) {
        String data = request.getParameter("data");
        JSONObject obj = new JSONObject();
        Map<String, Object> param = JsonUtil.getMapFromJson(data);
        List<Order> orders = orderService.findByOrderNum(param);
        List<OrderDto2> orderDto2s = null;
        if (orders.size() != 0) {
            Map<String, Object> param1 = new HashMap<String, Object>();
            param1.put("id", orders.get(0).getFlightId());
            List<Flight> flights = flightService.findById(param1);
            orderDto2s = new ArrayList<OrderDto2>();
            for (Order order : orders) {
                OrderDto2 orderDto2 = new OrderDto2();
                orderDto2.setId(order.getId());
                orderDto2.setFlightId(order.getFlightId());
                orderDto2.setUsername(order.getUsername());
                orderDto2.setIDcard(order.getIDcard());
                orderDto2.setTakeoffTime(flights.get(0).getTakeoffTime());
                orderDto2.setLandingTime(flights.get(0).getLandingTime());
                orderDto2.setTakeoffCity(flights.get(0).getTakeoffCity());
                orderDto2.setLandingCity(flights.get(0).getLandingCity());
                orderDto2.setPrice(flights.get(0).getPrice());
                orderDto2.setIsDel(order.getIsDel());
                orderDto2s.add(orderDto2);
            }
        }
        if (orderDto2s.size() != 0) {
            obj.put("code", 200);
            obj.put("orders", orderDto2s);
            obj.put("size", orderDto2s.size());
        } else {
            obj.put("code", 200);
            obj.put("message", "查无此订单！");
        }
        return obj;
    }

    /**
     * 退票
     */
    @RequestMapping("cancel")
    @ResponseBody
    public JSONObject cancel(HttpServletRequest request) {
        String data = request.getParameter("data");
        JSONObject obj = new JSONObject();
        Map<String, Object> param = JsonUtil.getMapFromJson(data);
        orderService.update(param);
        obj.put("code", 200);
        obj.put("message", "退票成功");
        return obj;
    }

    /**
     * 反馈
     */
    @RequestMapping("feedback")
    @ResponseBody
    public JSONObject feedback(HttpServletRequest request) {
        String data = request.getParameter("data");
        String name = request.getSession().getAttribute("username").toString();
        JSONObject obj = new JSONObject();
        Map<String, Object> param = JsonUtil.getMapFromJson(data);
        param.put("username", name);
        try {
        messageService.addM(param);
            obj.put("code", 200);
            obj.put("message", "反馈成功");
        }catch (Exception e){
            obj.put("code", 100);
            obj.put("message", "提交失败");
        }
        return obj;
    }
}
