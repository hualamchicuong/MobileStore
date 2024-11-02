package com.example.demospringbootapi.DL_Order;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import java.util.*;
import javax.persistence.*;

@Entity
@Table(name = "DL_Order")
public class DL_Order {
    @Id
    @SequenceGenerator(
            name = "dl_order_sequence",
            sequenceName = "dl_order_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.IDENTITY,
            generator = "dl_order_sequence"
    )
    private Long id;

    @Column(name="id_user")
    private Long id_user;

    @Column(name="uid")
    private String uid;

    @Column(name="total_cost")
    private Long total_cost;

    @Column(name="state")
    private String state;

    @Column(name="address")
    private String address;

    @Column(name="note")
    private String note;

    @Column(name="total_cost_vat")
    private Long total_cost_vat;

    @Column(name="payment_method")
    private String payment_method;

    @Column(name="order_date")
    private Date order_date;

    public DL_Order(Long id_user, String uid, Long total_cost, String state, String address, String note, Long total_cost_vat, String payment_method, Date order_date) {
        this.id_user = id_user;
        this.uid = uid;
        this.total_cost = total_cost;
        this.state = state;
        this.address = address;
        this.note = note;
        this.total_cost_vat = total_cost_vat;
        this.payment_method = payment_method;
        this.order_date = order_date;
    }

    public DL_Order() {

    }


    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public Long getTotal_cost_vat() {
        return total_cost_vat;
    }

    public void setTotal_cost_vat(Long total_cost_vat) {
        this.total_cost_vat = total_cost_vat;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId_user() {
        return id_user;
    }

    public void setId_user(Long id_user) {
        this.id_user = id_user;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public Long getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(Long total_cost) {
        this.total_cost = total_cost;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
