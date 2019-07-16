package com.tbstro.cp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GeneralController {
    @RequestMapping({"", "homepage"})
    public String toHomePage() {
        return "index";
    }
}
