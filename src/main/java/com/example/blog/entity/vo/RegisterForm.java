package com.example.blog.entity.vo;

public class RegisterForm {
    private String username;
    private String nickname;
    private String password1;
    private String password2;

    public RegisterForm(String username, String nickname, String password1, String password2) {
        this.username = username;
        this.nickname = nickname;
        this.password1 = password1;
        this.password2 = password2;
    }

    public RegisterForm() {
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

    public String getPassword1() {
        return password1;
    }

    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }
}
