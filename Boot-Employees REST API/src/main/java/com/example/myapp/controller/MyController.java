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
        return "welcome"; // → welcome.jsp
    }

    @GetMapping("/first")
    public String showFirst() {
        return "first"; // → first.jsp
    }
    //20250428->20250430 상세 추가 
    @GetMapping("/products")
    public String showProducts() {
        return "products"; // → products.jsp
    }
    
    //20250430
    @GetMapping("/product")
    public String showProduct() {
        return "product"; // → product.jsp
    }
    //20250428
    @GetMapping("/request")
    public String showRequest() {
        return "request"; // → request.jsp
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
        return "request01"; // → request01.jsp
    }
    
    //20250429
    @GetMapping("/request02")
    public String showRequest02() {
        return "request02"; // → request02.jsp
    }
    //20250429
    @GetMapping("/start")
    public String showStart() {
        return "start"; // → start.jsp
    }
    //20250429
    @GetMapping("/move")
    public String showMove() {
        return "move"; // → move.jsp
    }
    
    @GetMapping("/forward")
    public String showForward() {
        return "forward"; // → forward.jsp
    }
    @GetMapping("/redirect")
    public String showRedirect() {
        return "redirect"; // → redirect.jsp
    }
    
    @GetMapping("/response")
    public String showResponse() {
        return "response"; // → response.jsp
    }
    
    @GetMapping("/response01")
    public String showResponse01() {
        return "response01"; // → response01.jsp
    }
    
    @PostMapping("/response01_process")
    public String showResponse01_process() {
        return "response01_process"; // → response01_process.jsp
    }
    
    @GetMapping("/response01_success")
    public String showResponse01_success() {
        return "response01_success"; // → response01_success.jsp
    }
    
    @GetMapping("/response01_failed")
    public String showResponse01_failed() {
        return "response01_failed"; // → response01_failed.jsp
    }
    //20250501
    @GetMapping("/form01")
    public String showform01() {
        return "form01"; // → form01.jsp
    }
    
  //20250501
    @PostMapping("/form01_process")
    public String showform01_process() {
        return "form01_process"; // → form01_process.jsp
    }
}
