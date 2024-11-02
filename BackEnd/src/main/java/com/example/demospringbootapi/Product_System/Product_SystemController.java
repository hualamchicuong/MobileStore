package com.example.demospringbootapi.Product_System;

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

import java.util.List;

@RestController
@RequestMapping(path = "api/sp/product")
public class Product_SystemController {

    private final Product_SystemService productSystemService;

    @Autowired
    public Product_SystemController(Product_SystemService productSystemService) {
        this.productSystemService = productSystemService;
    }

    @GetMapping("/sys/getAllSys")
    public ResponseEntity<List<Product_System>> getAllSystem(){
        List<Product_System> productSys = productSystemService.getAllProductSys();
        return new ResponseEntity<>(productSys, HttpStatus.OK);

    }

    @GetMapping("/{id}/sys")
    public ResponseEntity<List<Product_System>> getProductImgById(@PathVariable("id") int id_product) {
        List<Product_System> productSys = productSystemService.getProductSysById(id_product);
        return new ResponseEntity<>(productSys, HttpStatus.OK);
    }

    @PostMapping("/updateProductSystem")
    public ResponseEntity<Boolean> updateProductSystem(@RequestBody ProductSystemUpdateData productSystemUpdateData){
        Product_System updateProductSys = new Product_System(Integer.parseInt(productSystemUpdateData.getId()),Integer.parseInt(productSystemUpdateData.getId_product()) ,productSystemUpdateData.getName(),productSystemUpdateData.getValue());
        return new ResponseEntity<>(productSystemService.updateProductSys(updateProductSys),HttpStatus.ACCEPTED);
    }


}
