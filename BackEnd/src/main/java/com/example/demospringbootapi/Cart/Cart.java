package com.example.demospringbootapi.Cart;

import java.util.*;
import javax.persistence.*;

@Entity
@Table(name = "Cart")
public class Cart {
    @Id
    @SequenceGenerator(
            name = "cart_sequence",
            sequenceName = "cart_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.IDENTITY,
            generator = "cart_sequence"
    )
    private Long id;

    @Column(name="id_user")
    private Long id_user;

    @Column(name="uid")
    private String uid;

    public Cart(){

    }

    public Cart( Long id_user, String uid) {
        this.id_user = id_user;
        this.uid = uid;
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
}