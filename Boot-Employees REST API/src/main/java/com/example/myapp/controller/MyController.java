package com.example.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    //20250428
    @GetMapping("/request")
    public String showRequest() {
        return "request"; // → hello.jsp
    }
    //20250428   
    // 수정: /process는 GET과 POST 모두 처리할 수 있게
    @RequestMapping("/process")
    public String processRequest() {
        return "process"; // → process.jsp
    }
    
    //20250429
    @GetMapping("/request01")
    public String showRequest01() {
        return "request01"; // → hello.jsp
    }
    
    //20250429
    @GetMapping("/request02")
    public String showRequest02() {
        return "request02"; // → hello.jsp
    }
    //20250429
    @GetMapping("/start")
    public String showStart() {
        return "start"; // → hello.jsp
    }
    //20250429
    @GetMapping("/move")
    public String showMove() {
        return "move"; // → hello.jsp
    }
    
    @GetMapping("/forward")
    public String showForward() {
        return "forward"; // → hello.jsp
    }
    @GetMapping("/redirect")
    public String showRedirect() {
        return "redirect"; // → hello.jsp
    }
    
    @GetMapping("/response")
    public String showResponse() {
        return "response"; // → hello.jsp
    }
    
    @GetMapping("/response01")
    public String showResponse01() {
        return "response01"; // → hello.jsp
    }
    
    @PostMapping("/response01_process")
    public String showResponse01_process() {
        return "response01_process"; // → hello.jsp
    }
    
    @GetMapping("/response01_success")
    public String showResponse01_success() {
        return "response01_success"; // → hello.jsp
    }
    
    @GetMapping("/response01_failed")
    public String showResponse01_failed() {
        return "response01_failed"; // → hello.jsp
    }
}
