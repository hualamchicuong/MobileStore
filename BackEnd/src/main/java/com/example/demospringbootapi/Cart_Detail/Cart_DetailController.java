package com.example.demospringbootapi.Cart_Detail;
import com.example.demospringbootapi.Cart.CartService;

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
@RequestMapping(path = "api/cart/detail")
public class Cart_DetailController {
    private final Cart_DetailService cart_detailService;

    @Autowired
    public Cart_DetailController(Cart_DetailService cart_detailService){
        this.cart_detailService = cart_detailService;
    }

    @GetMapping("/{cart_id}")
    public ResponseEntity<List<Cart_Detail>> checkCartDetail (@PathVariable("cart_id") int cart_id) {
        return new ResponseEntity<>(cart_detailService.getAllCart(cart_id),HttpStatus.OK);
    }

    @PostMapping("/getCartDetail")
    public ResponseEntity<Cart_Detail> getCartDetail(@RequestBody CartData Cart_Data) throws ParseException{
        int id_Cart = Integer.parseInt(Cart_Data.getId_Cart());
        int id_Product = Integer.parseInt(Cart_Data.getId_Product());
        return new ResponseEntity<>(cart_detailService.getCartDetail(id_Cart,id_Product),HttpStatus.OK);
    }


    @PostMapping("/login/getCart/addFromProductDetail")
    public ResponseEntity<Long> checkCartDetail(@RequestBody CartData Cart_Data) throws ParseException {
        int id_Cart = Integer.parseInt(Cart_Data.getId_Cart());
        int id_Product = Integer.parseInt(Cart_Data.getId_Product());
        int number = Integer.parseInt(Cart_Data.getNumber());

        Cart_Detail CartDetail = cart_detailService.getCartDetail(id_Cart,id_Product);
        if (CartDetail != null){
            cart_detailService.updateCartDetail(id_Cart,id_Product,number,true);
            return new ResponseEntity<>(CartDetail.getId(),HttpStatus.ACCEPTED);
        }
        else {
            Cart_Detail newCartDetail = new Cart_Detail(id_Cart,id_Product,number);
            cart_detailService.createCartDetail(newCartDetail);
            return new ResponseEntity<>(newCartDetail.getId(),HttpStatus.CREATED);
        }
    }

    @PostMapping("/login/getCart")
    public ResponseEntity<Long> updateCartDetail(@RequestBody CartData Cart_Data) throws ParseException {
        int id_Cart = Integer.parseInt(Cart_Data.getId_Cart());
        int id_Product = Integer.parseInt(Cart_Data.getId_Product());
        int number = Integer.parseInt(Cart_Data.getNumber());

        Cart_Detail CartDetail = cart_detailService.getCartDetail(id_Cart,id_Product);
        cart_detailService.updateCartDetail(id_Cart,id_Product,number,false);
        return new ResponseEntity<>(CartDetail.getId(),HttpStatus.ACCEPTED);
    }

    @PostMapping("/deleteProduct")
    public ResponseEntity<Integer> deleteProduct(@RequestBody CartData cartData) throws ParseException{
        cart_detailService.deleteProduct(Integer.parseInt(cartData.getId_Cart()),Integer.parseInt(cartData.getId_Product()));
        return new ResponseEntity<>(1,HttpStatus.OK);
    }


}
