package com.example.demospringbootapi.Product_Image;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.*;
import javax.persistence.*;

@Entity
@Table(name = "PRODUCT_IMAGE")
public class Product_Image {
    @Id
    @SequenceGenerator(
            name = "product_image_sequence",
            sequenceName = "product_image_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.IDENTITY,
            generator = "product_image_sequence"
    )
    private int id;

    @Column(name="img_path")
    private String img_path;

    @Column(name="id_product")
    private int id_product;

    public Product_Image (){

    }

    public Product_Image(int id, String img_path, int id_product) {
        this.id = id;
        this.img_path = img_path;
        this.id_product = id_product;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg_path() {
        return img_path;
    }

    public void setImg_path(String img_path) {
        this.img_path = img_path;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }


}


