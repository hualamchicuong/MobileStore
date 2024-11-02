package com.example.demospringbootapi.Account;

import java.util.*;
import javax.persistence.*;

@Entity
@Table(name = "Account")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="username")
    private String username;

    @Column(name="name")
    private String name;

    @Column(name="uid")
    private String uid;

    @Column(name="email")
    private String email;

    @Column(name="phone_number")
    private String phone_number;

    @Column(name="address")
    private String address;

    public Account(String username, String name, String uid, String email, String phone_number, String address) {
        this.username = username;
        this.name = name;
        this.uid = uid;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
    }


    public Account(Long id, String username, String name, String uid, String email, String phone_number, String address) {
        this.id = id;
        this.username = username;
        this.name = name;
        this.uid = uid;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
    }

    public Account() {

    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}


