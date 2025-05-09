package com.example.myapp;

import java.io.File;

import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class FileUploadInitializer {

    @PostConstruct
    public void init() {
        String uploadDir = "src/main/resources/static/upload"; // 업로드 경로 설정
        File uploadFolder = new File(uploadDir);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs(); // 폴더가 없으면 생성
        }
    }
}
