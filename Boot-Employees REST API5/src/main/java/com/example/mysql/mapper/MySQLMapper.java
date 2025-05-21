package com.example.mysql.mapper;

import org.apache.ibatis.annotations.Select;

public interface MySQLMapper {
    @Select("SELECT 'MySQL Test'")
    String testMySQL();
}