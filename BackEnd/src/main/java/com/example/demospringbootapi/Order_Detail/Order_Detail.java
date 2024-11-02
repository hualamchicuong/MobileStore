package com.example.demospringbootapi.Order_Detail;

import javax.persistence.*;


@Entity
@Table(name = "Order_Detail")
public class Order_Detail {
    @Id
    @SequenceGenerator(
            name = "order_detail_sequence",
            sequenceName = "order_detail_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.IDENTITY,
            generator = "order_detail_sequence"
    )
    private int id;

    @Column(name="id_order")
    private int id_order;

    @Column(name="id_product")
    private int id_product;

    @Column(name="quantity")
    private int quantity;

    @Column(name="cost")
    private Long cost;

    public Order_Detail() {

    }

    public Order_Detail(int id_order, int id_product, int quantity, Long cost) {
        this.id_order = id_order;
        this.quantity = quantity;
        this.id_product = id_product;
        this.cost = cost;
    }

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public Long getCost() {
        return cost;
    }

    public void setCost(Long cost) {
        this.cost = cost;
    }
}
