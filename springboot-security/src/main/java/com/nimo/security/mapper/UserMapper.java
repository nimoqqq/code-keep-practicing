package com.nimo.security.mapper;

import com.nimo.security.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {

    @Select("SELECT * FROM users WHERE username=#{username}")
    User findByUserName(@Param("username") String username);
}
