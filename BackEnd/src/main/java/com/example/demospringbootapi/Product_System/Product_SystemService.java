package com.example.demospringbootapi.Product_System;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Product_SystemService {
    private final Product_SystemRepo productSystemRepo;

    @Autowired
    public Product_SystemService(Product_SystemRepo productSystemRepo) {
        this.productSystemRepo = productSystemRepo;
    }

    public List<Product_System> getProductSysById(int id_product){
        return productSystemRepo.findProduct_SystemsById_product(id_product);
    }

    public List<Product_System> getAllProductSys(){
        return productSystemRepo.findAll();
    }

    public Boolean updateProductSys(Product_System updateProduct){
        productSystemRepo.save(updateProduct);
        return true;
    }


}
