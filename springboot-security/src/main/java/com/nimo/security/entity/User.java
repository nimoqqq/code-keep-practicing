package com.nimo.security.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

/**
 * @program: code-keep-practicing
 * @ClassName: User
 * @description:
 * @author: chuf
 * @create: 2022-01-15 16:59
 **/
public class User implements UserDetails {
    private Long id;

    private String username;

    private String password;

    private String roles;

    private boolean enable;

    private List<GrantedAuthority> authorities;

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    @Override
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    // 账户是否没有过期
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
    // 账户是否没有被锁定
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    // 密码是否没有过期
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    // 以及账户是否可用
    @Override
    public boolean isEnabled() {
        return this.enable;
    }

    public void setAuthorities(List<GrantedAuthority> authorities) {
        this.authorities = authorities;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.authorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object obj) {

        return obj instanceof User?this.username.equals(((User)obj).username):false;
    }

    @Override
    public int hashCode() {
        return this.username.hashCode();
    }
}
