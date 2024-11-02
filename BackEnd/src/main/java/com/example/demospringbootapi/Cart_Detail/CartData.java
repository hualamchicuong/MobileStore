package com.example.demospringbootapi.Cart_Detail;

public class CartData {
    private String id_Cart;

    private String id_Product;

    private String number;

    public CartData(String id_Cart, String id_Product, String number) {
        this.id_Cart = id_Cart;
        this.id_Product = id_Product;
        this.number = number;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getId_Cart() {
        return id_Cart;
    }

    public void setId_Cart(String id_Cart) {
        this.id_Cart = id_Cart;
    }

    public String getId_Product() {
        return id_Product;
    }

    public void setId_Product(String id_Product) {
        this.id_Product = id_Product;
    }
}
