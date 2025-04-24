package com.example.myapp.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.ShallowEtagHeaderFilter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.myapp.commons.HttpMethodOverrideFilter;

import jakarta.servlet.Filter;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Bean
    FilterRegistrationBean<HttpMethodOverrideFilter> httpMethodOverrideFilter() {
        FilterRegistrationBean<HttpMethodOverrideFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new HttpMethodOverrideFilter());
        registrationBean.addUrlPatterns("/api/*"); // 필터가 적용될 URL 패턴
        return registrationBean;
    }
    
    @Bean
    Filter shallowEtagHeaderFilter() {
    	return new ShallowEtagHeaderFilter();
    }

}