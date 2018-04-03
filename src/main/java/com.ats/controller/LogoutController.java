package com.ats.controller;

import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/")
public class LogoutController {
    /**
     * 退出登录
     *
     * @param request
     * @return
     */
    @RequestMapping("logout1")
    public String logout1(HttpServletRequest request) {
        JSONObject obj = new JSONObject();
        request.getSession().removeAttribute("username");
        obj.put("code", 200);
        obj.put("message", "success");
        request.getSession().removeAttribute("id");
        return "login";
    }

    /**
     * 退出登录
     *
     * @param request
     * @return
     */
    @RequestMapping("logout2")
    public String logout2(HttpServletRequest request) {
        JSONObject obj = new JSONObject();
        request.getSession().removeAttribute("admin");
        obj.put("code", 200);
        obj.put("message", "success");
        request.getSession().removeAttribute("id");
        return "login_manager";
    }

}
