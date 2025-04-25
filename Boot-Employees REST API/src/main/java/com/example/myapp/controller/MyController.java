package com.example.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {

    @GetMapping("/hello")
    public String showPage() {
        return "hello"; // → hello.jsp
    }

    @GetMapping("/welcome")
    public String showPage2() {
        return "welcome"; // → hello.jsp
    }

    @GetMapping("/first")
    public String showFirst() {
        return "first"; // → hello.jsp
    }

    @GetMapping("/product")
    public String showProduct() {
        return "product"; // → hello.jsp
    }
}
