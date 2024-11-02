package com.example.demospringbootapi.Product_Image;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Product_ImageService {
    private final Product_ImageRepo productImageRepo;

    @Autowired
    public Product_ImageService(Product_ImageRepo productImageRepo) {
        this.productImageRepo = productImageRepo;
    }

    public List<Product_Image> GetAllProducIMG() {
        return productImageRepo.findAll();
    }

    public List<Product_Image> getProductImgById(int id_product){
        return productImageRepo.findProduct_ImagesById_product(id_product);
    }

    public List <Product_Image> getProductImgByProductType(String type){
        return productImageRepo.findProduct_ImagesByProductType(type);
    }
}
