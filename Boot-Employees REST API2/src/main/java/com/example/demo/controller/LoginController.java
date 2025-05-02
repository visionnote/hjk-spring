package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.UserDTO;
import com.example.demo.mapper.UserMapper;

@Controller
public class LoginController {
	
	@Autowired 
	private UserMapper  userMapper;
	
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}
	
	@PostMapping("/login")  // 여기를 반드시 추가
	public String login(@RequestParam String userId, @RequestParam String password, Model model) {
		return "loginFailed";
	}
	
	@GetMapping("/loginFailed")
	public String loginFailed() {
		return "loginFailed";
	}

}
