package com.example.demospringbootapi.Account;

public class LoginData {
    private String username;
    private String email;
    private String uid;
    private String name;


    public LoginData(String username, String email, String uid, String name, String phone_number) {
        this.username = username;
        this.email = email;
        this.uid = uid;
        this.name = name;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }
}
