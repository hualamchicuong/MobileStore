package com.example.demospringbootapi.Cart_Detail;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
@Repository
public interface Cart_DetailRepo extends JpaRepository<Cart_Detail, Long> {
    @Query("SELECT cd FROM Cart_Detail cd WHERE cd.id_cart = :id_cart AND cd.id_product = :id_product")
    Cart_Detail findCart_DetailById_cartAndId_product(@Param("id_cart") int id_cart, @Param("id_product") int id_product);


    @Query("SELECT cd FROM Cart_Detail cd WHERE cd.id_cart = :id_cart")
    List<Cart_Detail> findCart_DetailsById_cart(@Param("id_cart") int id_cart);


}
