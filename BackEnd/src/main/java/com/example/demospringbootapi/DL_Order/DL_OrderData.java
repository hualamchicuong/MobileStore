package com.example.demospringbootapi.DL_Order;

import java.util.*;
import javax.persistence.*;
public class DL_OrderData {

    private String uid;

    private String state;

    private String address;

    private String note;

    private String totalcost;

    private String totalcostVAT;

    private String paymentMethod;

    private String orderDate;

    public DL_OrderData(String uid, String state, String address, String note, String totalcost, String totalcostVAT, String paymentMethod, String orderDate) {
        this.uid = uid;
        this.state = state;
        this.address = address;
        this.note = note;
        this.totalcost = totalcost;
        this.totalcostVAT = totalcostVAT;
        this.paymentMethod = paymentMethod;
        this.orderDate = orderDate;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }



    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getTotalcostVAT() {
        return totalcostVAT;
    }

    public void setTotalcostVAT(String totalcostVAT) {
        this.totalcostVAT = totalcostVAT;
    }

    public String getTotalcost() {
        return totalcost;
    }

    public void setTotalcost(String totalcost) {
        this.totalcost = totalcost;
    }

    public String getAddress() {
        return address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
