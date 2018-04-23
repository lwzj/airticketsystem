package com.ats.controller;

import com.ats.bean.Admin;
import com.ats.bean.Flight;
import com.ats.bean.Message;
import com.ats.service.IAdminService;
import com.ats.service.IFlightService;
import com.ats.service.IMessageService;
import com.ats.utils.JsonUtil;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    Logger logger = LoggerFactory.getLogger(AdminController.class);
    @Autowired
    private IAdminService adminService;
    @Autowired
    private IFlightService flightService;
    @Autowired
    private IMessageService messageService;
    /**
     * 登陆
     */
    @RequestMapping("/login")
    @ResponseBody
    public JSONObject login(HttpServletRequest request) {
        logger.debug("login ...");
        String data = request.getParameter("data");
        JSONObject object = new JSONObject();
        Map<String, Object> param = JsonUtil.getMapFromJson(data);
        List<Admin> users = adminService.getUser(param);
        if (users.size() > 0) {
            object.put("code", 200);
            object.put("message", "success");
            object.put("uid", users.get(0).getId());
            object.put("username", users.get(0).getUsername());
            request.getSession().setAttribute("id",users.get(0).getId());
            request.getSession().setAttribute("username",users.get(0).getUsername());
            request.getSession().setAttribute("admin",users.get(0));

        }else{
            object.put("code", 100);
            object.put("message", "用户名密码错误");
        }
        return object;
    }

    /**
     * 录入航班
     */
    @RequestMapping("addFlight")
    @ResponseBody
    public JSONObject addFlight(HttpServletRequest request) {
        String data = request.getParameter("data");
        JSONObject obj = new JSONObject();
        Map<String, Object> param = JsonUtil.getMapFromJson(data);
        int id = flightService.add(param);
        if (id != 0) {
            obj.put("code", 200);
            obj.put("message", "添加成功");
        }else{
            obj.put("code", 100);
            obj.put("message", "添加失败");
        }
        return obj;
    }

    /**
     * 查看意见
     */
    @RequestMapping("queryMessage")
    @ResponseBody
    public JSONObject queryMessage(HttpServletRequest request) {
//        String data = request.getParameter("data");
        JSONObject obj = new JSONObject();
//        Map<String, Object> param = JsonUtil.getMapFromJson(data);
        List<Message> messages = messageService.queryAll();
        if (messages.size() != 0) {
            obj.put("code", 200);
            obj.put("size", messages.size());
            obj.put("messages", messages);
        }else{
            obj.put("code", 100);
            obj.put("message", "没有反馈意见");
        }
        return obj;
    }

    /**
     * 查询航班
     */
    @RequestMapping("queryFlight")
    @ResponseBody
    public JSONObject queryFlight(HttpServletRequest request) {
//        String data = request.getParameter("data");
        JSONObject obj = new JSONObject();
//        Map<String, Object> param = JsonUtil.getMapFromJson(data);
        List<Flight> flights = flightService.findAll();
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
     * 查询航班
     */
    @RequestMapping("delete")
    @ResponseBody
    public JSONObject deleteFlihrt(HttpServletRequest request) {
        String data = request.getParameter("data");
        JSONObject obj = new JSONObject();
        Map<String, Object> param = JsonUtil.getMapFromJson(data);
        flightService.deleteById(param);
        obj.put("code", 200);
        return obj;
    }

}
