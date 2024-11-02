package com.example.demospringbootapi.Account;

public class DetailData {

    private final String uid;
    private String phone_number;
    private String address;

    public DetailData(String uid, String phone_number, String address) {
        this.uid = uid;
        this.phone_number = phone_number;
        this.address = address;
    }

    public String getUid() {
        return uid;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
