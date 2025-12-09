package com.chuonghv.neno.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Value("${constant.app.env:}")
    private String appEnv;

    @GetMapping("/hello")
    public String hello() {
        return "Hello from GKE CI/CD from env: " + appEnv;
    }
}
