package com.example.demospringbootapi.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.*;

@Service
public class CartService {

    private final CartRepo cartRepo;

    @Autowired
    public CartService(CartRepo cartRepo){
        this.cartRepo = cartRepo;
    }

    public Cart getCartByIdUser(Long id_user){
        return cartRepo.findCartById_user(id_user);
    }

    public List<Cart> getAllCart(){
        return cartRepo.findAll();
    }

    public void createCart(Cart newCart){
        cartRepo.save(newCart);
    }
}
