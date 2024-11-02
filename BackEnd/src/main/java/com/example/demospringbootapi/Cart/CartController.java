package com.example.demospringbootapi.Cart;
import com.example.demospringbootapi.Account.Account;
import com.example.demospringbootapi.Account.AccountService;
import com.example.demospringbootapi.Account.LoginData;
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
@RequestMapping(path = "api/cart")
public class CartController {

    private final CartService cartService;
    private AccountService accountService;

    @Autowired
    public CartController(CartService cartService, AccountService accountService) {

        this.cartService = cartService;
        this.accountService = accountService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cart> getCartAccountByUid(@PathVariable("id") Long uid) {
        Long id = accountService.getAccountById(uid).getId();
        Cart cart = cartService.getCartByIdUser(id);
        return new ResponseEntity<>(cart, HttpStatus.OK);
    }


    @PostMapping("/login/getAccount")
    public ResponseEntity<Long> checkAccount(@RequestBody LoginData Login_data) throws ParseException {

        String username = Login_data.getUsername();
        String email = Login_data.getEmail();
        String uid = Login_data.getUid();
        String name =  Login_data.getName();

        List<Account> listAccount = accountService.getAccount();
        Account[] accountArray = listAccount.toArray(new Account[0]);
        List<Cart> listCart = cartService.getAllCart();
        Cart[] cartArray = listCart.toArray(new Cart[0]);

        for (int i = 0; i < accountArray.length; i++) {
            if (accountArray[i].getUid().equals(uid)) {
                for (int j = 0; j < cartArray.length; j++) {
                    if (accountArray[i].getUid().equals(cartArray[j].getUid())) {
                        return new ResponseEntity<>(cartArray[j].getId(), HttpStatus.OK);
                    }
                }
                Cart newCart = new Cart(accountArray[i].getId(), accountArray[i].getUid());
                cartService.createCart(newCart);
                return new ResponseEntity<>(newCart.getId(), HttpStatus.CREATED);
            }
        }


        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

}
