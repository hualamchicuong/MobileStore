package com.example.demospringbootapi.Product_Image;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
@Repository
public interface Product_ImageRepo extends JpaRepository<Product_Image, Long> {
    @Query("SELECT p FROM Product_Image p WHERE p.id_product = :id_product")
    List<Product_Image> findProduct_ImagesById_product(@Param("id_product") int id_product);

    @Query("SELECT DISTINCT pi FROM Product_Image pi WHERE pi.id_product IN (SELECT p.id FROM Product p WHERE p.type = :type)")
    List<Product_Image> findProduct_ImagesByProductType(@Param("type") String type);

}
