package com.ats.controller;

import com.ats.bean.Admin;
import com.ats.service.IAdminService;
import com.ats.service.IFlightService;
import com.ats.utils.JsonUtil;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
}
