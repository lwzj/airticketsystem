package com.ats.controller;

import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminController {
    /**
     * 登陆
     */
    @RequestMapping("/login")
    @ResponseBody
    public JSONObject login(HttpServletRequest request) {
        JSONObject obj = new JSONObject();
        return obj;
    }
}
