package com.example.demospringbootapi.Product_System;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.*;
import javax.persistence.*;

@Entity
@Table(name = "PRODUCT_SYSTEM")
public class Product_System {
    @Id
    @SequenceGenerator(
            name = "product_system_sequence",
            sequenceName = "product_system_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.IDENTITY,
            generator = "product_system_sequence"
    )
    private int id;

    @Column(name="id_product")
    private int id_product;

    @Column(name="name")
    private String name;

    @Column(name="value")
    private String value;

    public Product_System (){

    }

    public Product_System(int id, int id_product, String name, String value) {
        this.id = id;
        this.id_product = id_product;
        this.name = name;
        this.value = value;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}


