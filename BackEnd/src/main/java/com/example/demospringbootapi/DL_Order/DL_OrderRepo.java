package com.example.demospringbootapi.DL_Order;

import com.example.demospringbootapi.Account.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


@Repository
public interface DL_OrderRepo extends JpaRepository<DL_Order, Long>{
    @Query("SELECT ord FROM DL_Order ord WHERE ord.uid = :uid")
    List<DL_Order> findDL_OrderByUid(@Param("uid") String uid);

    @Query("SELECT ord FROM DL_Order ord WHERE ord.id = :id")
    DL_Order findDL_OrderByID(@Param("id") Long id);

    @Query("SELECT MAX(ord.id) FROM DL_Order ord")
    DL_Order findMaxDL_Order();

}


