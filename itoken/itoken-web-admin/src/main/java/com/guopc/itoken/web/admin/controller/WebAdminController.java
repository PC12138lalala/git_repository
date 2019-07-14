package com.guopc.itoken.web.admin.controller;

import com.guopc.itoken.web.admin.service.WebAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebAdminController {

    @Autowired
    private WebAdminService webAdminService;

    @RequestMapping({"","login"})
    public String login() {

        String json = webAdminService.login("guopc", "123456");
        System.out.println(json);
        return "index";
    }
}
