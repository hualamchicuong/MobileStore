package com.example.demospringbootapi.Order_Detail;

import com.example.demospringbootapi.Product.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Repository
public interface Order_DetailRepo extends JpaRepository<Order_Detail, Long>{
    @Query("SELECT od FROM Order_Detail od WHERE od.id_order = :id_order")
    List<Order_Detail> findOrder_DetailsById_order(@Param("id_order") int id_order);

//    @Query("SELECT od FROM Order_Detail od WHERE od.id_cart_detail = :id_cart_detail")
//    Order_Detail findOrder_DetailById_cart_detail(@Param("id_cart_detail") Long id_cart_detail);

    @Query("SELECT p FROM Product p JOIN Cart_Detail cd ON p.id = cd.id_product AND cd.id = :id_cart_detail")
    Product findProductByIdCartDetail(@Param("id_cart_detail") Long id_cart_detail);

    @Query("SELECT SUM(od.cost) FROM Order_Detail od WHERE od.id_order = :id_order")
    Long calcTotalCostByIdOrder(@Param("id_order") int id_order);

}
