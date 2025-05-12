package com.example.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

@WebFilter(urlPatterns = "/*")  // 모든 요청에 대해 필터링
public class LoggingFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(LoggingFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        logger.info("LoggingFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {

        String remoteAddr = request.getRemoteAddr();
        String requestURI = request.getLocalName();
        String protocol = request.getProtocol();

        logger.info("Request from IP: {}, URI: {}, Protocol: {}", remoteAddr, requestURI, protocol);

        // 필터 체인 처리
        chain.doFilter(request, response);

        logger.info("Response completed for URI: {}", requestURI);
    }

    @Override
    public void destroy() {
        logger.info("LoggingFilter destroyed");
    }
}

