package com.example.blog.entity.vo;

import javax.validation.constraints.NotNull;

public class UserVO {
    private String username;
    private String nickname;
    private String password;

    public UserVO(@NotNull String username, @NotNull String nickname, @NotNull String password) {
        this.username = username;
        this.nickname = nickname;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
