package com.example.demospringbootapi.Product;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

    private final ProductRepo productRepo;

    @Autowired
    public ProductService(ProductRepo productRepo) {
        this.productRepo = productRepo;
    }

    public List<Product> getProduct(){
        return productRepo.findAll();
    }

    public Product getProductById(Long id){ return productRepo.getById(id);}

    public List<Product> getProductsByType(String type) {
        return productRepo.findProductsByType(type);
    }

    public List<Product> getProductColorsByName(String name) {
        return productRepo.findProductColorsByName(name);
    }

    public List<Product> getProductStoragesByName(String name){
        return productRepo.findProductStoragesByName(name);
    }

    public Product getProductByColor_Name_Storage(String color, String name, String storage){
        return productRepo.findProductByColorAndNameAndStorage(color,name,storage);
    }

    public Boolean updateProduct(Product updatedProduct){
        productRepo.save(updatedProduct);
        return true;
    }

//    public List<Product> getHomepageListProduct(String model){
//        return productRepo.findHomePageListProduct(model,"Đen");
//    }
}
