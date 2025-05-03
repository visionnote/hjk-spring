package com.example.myapp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(scanBasePackages = {"com.example.myapp", "com.example.upload"})
@MapperScan({
    "com.example.myapp.mapper",
    "com.example.myapp.hr.dao"
})
@EnableJpaRepositories(basePackages = "com.example.upload")
@EntityScan(basePackages = "com.example.upload")
public class MyappApplication extends SpringBootServletInitializer {

    // 외부 Tomcat에서 실행될 때 필요한 설정
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(MyappApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(MyappApplication.class, args);
    }
}
