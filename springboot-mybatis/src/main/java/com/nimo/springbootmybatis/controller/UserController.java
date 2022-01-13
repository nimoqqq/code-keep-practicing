package com.nimo.springbootmybatis.controller;

import com.nimo.springbootmybatis.entity.OrmUser;
import com.nimo.springbootmybatis.servlet.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/getUsers")
    public List<OrmUser> getUsers() {
        List<OrmUser> users = userService.getAll();
        return users;
    }

    @GetMapping("/getUser")
    public OrmUser getUser(Integer id) {
        OrmUser user = userService.selectByPrimaryKey(id);
        return user;
    }

    @PutMapping("/add")
    public void save(@RequestBody OrmUser user) {
        userService.insertSelective(user);
    }

    @PutMapping(value = "update")
    public void update(@RequestBody OrmUser user) {
        userService.updateByPrimaryKeySelective(user);
    }

    @DeleteMapping(value = "/delete/{id}")
    public void delete(@PathVariable("id") Integer id) {
        userService.deleteByPrimaryKey(id);
    }
}
