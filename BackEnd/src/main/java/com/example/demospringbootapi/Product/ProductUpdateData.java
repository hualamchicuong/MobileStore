package com.example.demospringbootapi.Product;

import java.util.Date;

public class ProductUpdateData {

    private String id;
    private String name;
    private String price;
    private String storage;
    private String color;
    private String quantity;
    private String type;
    private String drop;
    private String image;
    private String description;

    public ProductUpdateData(String id,String name, String price, String storage, String color, String quantity, String type, String drop, String image, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.storage = storage;
        this.color = color;
        this.quantity = quantity;
        this.type = type;
        this.drop = drop;
        this.image = image;
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDrop() {
        return drop;
    }

    public void setDrop(String drop) {
        this.drop = drop;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
