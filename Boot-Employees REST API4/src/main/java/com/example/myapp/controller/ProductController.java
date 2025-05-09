package com.example.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.myapp.service.ProductService;

import java.io.IOException;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/uploadExcel")
    public String showExcelUploadForm() {
        return "uploadExcel";  // uploadExcel.jsp로 이동
    }

    @PostMapping("/uploadExcel")
    public String uploadExcel(@RequestParam("excelFile") MultipartFile excelFile) {
        try {
            productService.processExcelFile(excelFile);
            return "redirect:/products";  // 상품 목록 페이지로 리디렉션
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/uploadExcel?error=true";  // 오류 처리
        }
    }
}
