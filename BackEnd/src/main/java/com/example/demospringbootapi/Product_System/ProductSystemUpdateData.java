package com.example.demospringbootapi.Product_System;

public class ProductSystemUpdateData {

    private String id;
    private String id_product;
    private String name;
    private String value;

    public ProductSystemUpdateData(String id,String id_product, String name, String value) {
        this.id = id;
        this.id_product = id_product;
        this.name = name;
        this.value = value;
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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getId_product() {
        return id_product;
    }

    public void setId_product(String id_product) {
        this.id_product = id_product;
    }
}

