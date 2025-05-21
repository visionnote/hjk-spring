package com.example.myapp;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
@MapperScan("com.example.myapp.dao")  // ← DAO 인터페이스 경로 지정
@SpringBootApplication(scanBasePackages = {"com.example.myapp", "com.example.upload"})
@MapperScan({
    "com.example.myapp.mapper",
    "com.example.myapp.hr.dao",
    "com.example.myapp.mysql.mapper",
    "com.example.myapp.oracle.mapper",
	"com.example.myapp.dao"  // ← DAO 인터페이스 경로 지정
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
        Timestamp now = new Timestamp(System.currentTimeMillis());
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = format.format(now);
        
        //System.out.println("오늘은"+strDate+"입니다");
        System.out.println("오늘은 " + strDate + "입니다");
    }
}
