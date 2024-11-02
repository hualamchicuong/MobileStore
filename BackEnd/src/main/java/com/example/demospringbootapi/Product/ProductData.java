package com.example.demospringbootapi.Product;

public class ProductData {

    private String name;

    private String color;

    private String storage;

    public ProductData(String name, String color, String storage) {
        this.name = name;
        this.color = color;
        this.storage = storage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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


