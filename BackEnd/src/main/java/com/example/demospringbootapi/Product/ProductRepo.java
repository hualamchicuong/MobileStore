package com.example.demospringbootapi.Product;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepo extends JpaRepository<Product, Long> {
    List<Product> findProductsByType(String type);

    List<Product> findProductsByName(String name);

    Product findProductByColorAndNameAndStorage(String color, String name, String storage);

    @Query("SELECT p FROM Product p WHERE p.id IN (SELECT MIN(p2.id) FROM Product p2 WHERE p2.name = :name GROUP BY p2.color)")
    List<Product> findProductColorsByName(@Param("name") String name);

    @Query("SELECT p FROM Product p WHERE p.id IN (SELECT MIN(p2.id) FROM Product p2 WHERE p2.name = :name GROUP BY p2.storage)")
    List<Product> findProductStoragesByName(@Param("name") String name);

//    @Query("SELECT p FROM Product p WHERE p.id IN (SELECT ps.id_product FROM Product_System ps WHERE ps.value = :model AND ps.id_product IN (SELECT ps2.id_product FROM Product_System ps2 WHERE ps.value = :color)) LIMIT 1")
//    List<Product> findHomePageListProduct(@Param("model") String model, @Param("color") String color);
}
