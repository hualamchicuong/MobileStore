package com.example.demospringbootapi.Cart_Detail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.*;

@Service
public class Cart_DetailService {
    private final Cart_DetailRepo cart_detailRepo;

    @Autowired
    public Cart_DetailService(Cart_DetailRepo cart_detailRepo){
        this.cart_detailRepo = cart_detailRepo;
    }

    public Cart_Detail getCartDetail(int Cart_id, int Cart_product){
        return cart_detailRepo.findCart_DetailById_cartAndId_product(Cart_id, Cart_product);
    }

    public void updateCartDetail(int Cart_id, int Cart_product, int number, boolean addFromProductDetail){
        Cart_Detail cartDetail = cart_detailRepo.findCart_DetailById_cartAndId_product(Cart_id,Cart_product);

        if(addFromProductDetail){
            int newNumber = cartDetail.getNumber() + number;
            cartDetail.setNumber(newNumber);
            cart_detailRepo.save(cartDetail);
        }
        else{
            cartDetail.setNumber(number);
            cart_detailRepo.save(cartDetail);
        }


    }

    public void createCartDetail(Cart_Detail newCartDetail){
        cart_detailRepo.save(newCartDetail);
    }

    public List<Cart_Detail> getAllCart(int cart_id){
        return cart_detailRepo.findCart_DetailsById_cart(cart_id);
    }

    public void deleteProduct(int cart_id, int product_id){
        Cart_Detail cartDetail = cart_detailRepo.findCart_DetailById_cartAndId_product(cart_id,product_id);
        cart_detailRepo.delete(cartDetail);
    }

    public Cart_Detail getCartDetailById(Long id){
        return cart_detailRepo.getById(id);
    }
}
