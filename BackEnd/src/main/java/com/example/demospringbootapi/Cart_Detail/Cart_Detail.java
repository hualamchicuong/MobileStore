package com.example.demospringbootapi.Cart_Detail;

import java.util.*;
import javax.persistence.*;

@Entity
@Table(name = "Cart_Detail")
public class Cart_Detail {
    @Id
    @SequenceGenerator(
            name = "cart_detail_sequence",
            sequenceName = "cart_detail_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.IDENTITY,
            generator = "cart_detail_sequence"
    )
    private Long id;

    @Column(name="id_cart")
    private int id_cart;

    @Column(name="id_product")
    private int id_product;

    @Column(name="number")
    private int number;

    public Cart_Detail(){

    }

    public Cart_Detail(int id_cart, int id_product, int number) {
        this.id_cart = id_cart;
        this.id_product = id_product;
        this.number = number;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getId_cart() {
        return id_cart;
    }

    public void setId_cart(int id_cart) {
        this.id_cart = id_cart;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
