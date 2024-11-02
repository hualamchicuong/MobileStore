package com.example.demospringbootapi.Product_Image;


import com.example.demospringbootapi.Account.Account;
import com.example.demospringbootapi.Product.Product;
import com.example.demospringbootapi.Product.ProductService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.hibernate.mapping.Any;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.util.*;

@RestController
@RequestMapping(path = "api/sp/product")
public class Product_ImageController {
    private final Product_ImageService productImageService;
    private final ProductService productService;

    @Autowired
    public Product_ImageController(Product_ImageService productImageService,ProductService productService) {
        this.productImageService = productImageService;
        this.productService = productService;
    }

    @GetMapping("/{id}/img")
    public ResponseEntity<List<Product_Image>> getProductImgById(@PathVariable("id") int id_product) {
        List<Product_Image> productImg = productImageService.getProductImgById(id_product);
        return new ResponseEntity<>(productImg, HttpStatus.OK);
    }

    @GetMapping("/img")
    public ResponseEntity<List<Product_Image>> getAllProductImg(){
        List<Product_Image> productImg = productImageService.GetAllProducIMG();
        return new ResponseEntity<>(productImg, HttpStatus.OK);
    }

    @GetMapping("/img/{type}")
    public ResponseEntity<List<Product_Image>> getProductImgByType(@PathVariable("type") String type){
        return new ResponseEntity<>(productImageService.getProductImgByProductType(type), HttpStatus.OK);


//        List<Product_Image> productImg = new ArrayList<>();
//        for(int i=0;i<productArray.length;i++){
//            String id_product = productArray[i].getId().toString();
//            List<Product_Image> productImgData = productImageService.getProductImgById(Integer.parseInt(id_product));
//            if(productImg.size() == 0){
//                productImg = productImgData;
//            }
//            else{
//                for(int j=0;i<productImg.size();j++){
//
//                }
//            }
//
//        }
    }
}
