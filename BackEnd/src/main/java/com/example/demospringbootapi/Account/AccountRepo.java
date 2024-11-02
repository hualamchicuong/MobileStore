package com.example.demospringbootapi.Account;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

@Repository
public interface AccountRepo extends JpaRepository<Account, Long> {
    @Query("SELECT a FROM Account a WHERE a.uid = :uid")
    Account findAccountByUid(@Param("uid") String uid);


}


