package com.example.oracle.mapper;

import org.apache.ibatis.annotations.Select;

public interface OracleMapper {
    @Select("SELECT 'Oracle Test' FROM DUAL")
    String testOracle();
}