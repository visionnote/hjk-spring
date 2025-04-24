package com.example.myapp.mapper;

import com.example.myapp.model.User;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    // 사용자 등록
    void insertUser(User user);

    // 전체 사용자 조회
    List<User> getAllUsers();

    // 특정 사용자 조회
    User getUser(int id); // ← 파라미터 필요

    // 사용자 정보 수정
    void updateUser(User user); // ← 반환값은 void, 파라미터는 User 객체

    void deleteUser(int id);

    List<User> getUsersByName(String name);

    List<User> searchUsers(String keyword);

    List<User> searchUsersByName(String keyword);

}
