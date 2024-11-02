package com.example.demospringbootapi.Product_System;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
@Repository
public interface Product_SystemRepo extends JpaRepository<Product_System, Long> {
    @Query("SELECT p FROM Product_System p WHERE p.id_product = :id_product")
    List<Product_System> findProduct_SystemsById_product(@Param("id_product") int id_product);
}
