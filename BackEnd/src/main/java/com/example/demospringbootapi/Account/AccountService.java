package com.example.demospringbootapi.Account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.*;

@Service
public class AccountService {
    private final AccountRepo accountRepo;

    @Autowired
    public AccountService(AccountRepo accountRepo) {
        this.accountRepo = accountRepo;
    }

    public List<Account> getAccount(){
        return accountRepo.findAll();
    }

    public void createAccount(Account newAccount){
        accountRepo.save(newAccount);
    }

    public void updateAccount(Account update) {accountRepo.save(update);}

    public Account getAccountByUid(String uid){
        return accountRepo.findAccountByUid(uid);
    }

    public Account getAccountById(Long id){
        return accountRepo.getById(id);
    }

}
