package com.example.myapp.controller;

import com.example.myapp.mapper.UserMapper;
import com.example.myapp.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserMapper userMapper;

    // 사용자 목록 조회
    @GetMapping("/users")
    public String getUsers(@RequestParam(required = false) String keyword, Model model) {
        List<User> users = userMapper.searchUsers(keyword);
        model.addAttribute("users", users);
        model.addAttribute("keyword", keyword); // 검색창에 값 유지용
        return "userList";
    }

    // 검색 기능
    @GetMapping("/search")
    public String searchUsers(@RequestParam("keyword") String keyword, Model model) {
        List<User> users = userMapper.searchUsersByName(keyword);
        model.addAttribute("users", users);
        model.addAttribute("keyword", keyword);
        return "userList"; // 기존 목록 화면 재사용
    }

    // 폼 페이지
    @GetMapping("/form")
    public String showForm() {
        return "form";
    }

    // 사용자 정보 수정 폼 (조회)
    @GetMapping("/edit/{id}")
    public String editUserForm(@PathVariable("id") int id, Model model) {
        User user = userMapper.getUser(id);
        model.addAttribute("user", user);
        return "user/edit"; // 수정 폼 JSP 페이지
    }

    // 사용자 정보 수정 처리
    @PostMapping("/update")
    public String updateUser(User user) {
        userMapper.updateUser(user);
        return "redirect:/users"; // 수정 후 사용자 목록 페이지로 리다이렉트
    }

    // 폼 데이터 처리
    @PostMapping("/submit")
    public String submitForm(@RequestParam String name, @RequestParam String age, Model model) {
        User user = new User();
        user.setName(name);
        user.setAge(Integer.parseInt(age));

        userMapper.insertUser(user); // 데이터베이스에 저장

        model.addAttribute("name", name);
        model.addAttribute("age", age);

        return "result";
    }

    // 사용자 삭제
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") int id) {
        userMapper.deleteUser(id);
        return "redirect:/users"; // 삭제 후 사용자 목록 페이지로 리다이렉트
    }

}
