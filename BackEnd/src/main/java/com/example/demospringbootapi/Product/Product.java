package com.example.demospringbootapi.Product;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.*;
import javax.persistence.*;

@Entity
@Table(name = "Product")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})

public class Product {
    @Id
    @SequenceGenerator(
            name = "product_sequence",
            sequenceName = "product_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.IDENTITY,
            generator = "product_sequence"
    )
    private Long id;
    @Column(name="drop")
    private Date drop;
    @Column(name="type")
    private String type;
    @Column(name="image")
    private String image;
    @Column(name="name")
    private String name;
    @Column(name="price")
    private Long price;
    @Column(name="quantity")
    private int quantity;
    @Column(name="description")
    private String description;
    @Column(name="color")
    private String color;
    @Column(name="storage")
    private String storage;

    public Product(){

    }

    public Product(Long id, Date drop, String type, String image, String name, Long price, int quantity, String description,String color,String storage) {
        this.id = id;
        this.drop = drop;
        this.type = type;
        this.image = image;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.color = color;
        this.storage = storage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDrop() {
        return drop;
    }

    public void setDrop(Date drop) {
        this.drop = drop;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }
}
