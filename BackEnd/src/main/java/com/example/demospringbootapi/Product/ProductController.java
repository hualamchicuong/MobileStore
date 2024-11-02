package com.example.demospringbootapi.Product;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping(path = "api/sp/product")
public class ProductController {

    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/list")

    public ResponseEntity<List<Product>> listProduct(){
        List<Product> list = productService.getProduct();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable("id") Long id) {
        Product productData = productService.getProductById(id);
        return new ResponseEntity<>(productData, HttpStatus.OK);
    }

    @GetMapping("/type/{type}")
    public ResponseEntity<List<Product>> getProductsByType(@PathVariable("type") String type) {
        List<Product> productData = productService.getProductsByType(type);
        return new ResponseEntity<>(productData, HttpStatus.OK);
    }

    @GetMapping("/model/{modelname}")
    public ResponseEntity<List<Product>> getProductColorsByName(@PathVariable("modelname") String modelname){
        List<Product> productData = productService.getProductColorsByName(modelname);
        return new ResponseEntity<>(productData, HttpStatus.OK);
    }

    @GetMapping("/storage/{modelname}")
    public ResponseEntity<List<Product>> getProductStoragesByName(@PathVariable("modelname") String modelname){
        List<Product> productData = productService.getProductStoragesByName(modelname);
        return new ResponseEntity<>(productData, HttpStatus.OK);
    }

    @PostMapping("/getIdProduct")
    public ResponseEntity<Product> getIdProductByColor_Name_Storage(@RequestBody ProductData productData) throws ParseException {
        String color = productData.getColor();
        String name = productData.getName();
        String storage = productData.getStorage();

        Product product = productService.getProductByColor_Name_Storage(color,name,storage);
        return new ResponseEntity<>(product, HttpStatus.OK);
    }

    @PostMapping("/updateProductInfo")
    public ResponseEntity<Boolean> updateProductInfo(@RequestBody ProductUpdateData productUpdateData) throws java.text.ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        formatter.setTimeZone(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
        Date drop = formatter.parse(productUpdateData.getDrop());

        Product updatedProduct = new Product(Long.parseLong(productUpdateData.getId()), drop,productUpdateData.getType(),productUpdateData.getImage(),productUpdateData.getName(),Long.parseLong(productUpdateData.getPrice()),Integer.parseInt(productUpdateData.getQuantity()),productUpdateData.getDescription(),productUpdateData.getColor(),productUpdateData.getStorage());
        return new ResponseEntity<>(productService.updateProduct(updatedProduct),HttpStatus.ACCEPTED);
    }

//    @GetMapping("/getHomePageProduct")
//    public ResponseEntity<List<Product>> getHomePage(){
//        List<Product> allproductList = productService.getProduct();
//        Product[] allproductsArray = allproductList.toArray(new Product[0]);
//        int count[] = new int[allproductList.size() + 1];
//        for(int i=0;i<allproductList.size();i++){
//            if()
//        }
//
//    }


}
