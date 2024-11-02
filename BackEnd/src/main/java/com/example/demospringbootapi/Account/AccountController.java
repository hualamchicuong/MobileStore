package com.example.demospringbootapi.Account;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import org.json.simple.parser.ParseException;

import java.util.*;


@RestController
@RequestMapping(path = "api")
public class AccountController {
    private final AccountService accountService;

    @Autowired
    public AccountController(AccountService accountService) {
        this.accountService = accountService;
    }

    @GetMapping("/login")
    public ResponseEntity<List<Account>> listAccount(){
        List<Account> list = accountService.getAccount();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }


    @GetMapping("/login/{uid}")
    public ResponseEntity<Account> getAccountByUid(@PathVariable("uid") String uid) {
        Account account = accountService.getAccountByUid(uid);
        return new ResponseEntity<>(account, HttpStatus.OK);
    }

//    @GetMapping("/login/userinfo/{id}")
//    public ResponseEntity<Account> getAccountById(@PathVariable("id") Long id{
//
//    }

    @PostMapping("/login/getAccount")
    public ResponseEntity<Account> checkAccount(@RequestBody LoginData Login_data) throws ParseException {

        String username = Login_data.getUsername();
        String email = Login_data.getEmail();
        String uid = Login_data.getUid();
        String name = Login_data.getName();


        List<Account> list = accountService.getAccount();
        Account[] accountArray = list.toArray(new Account[0]);
        for (int i = 0; i < accountArray.length; i++) {
            if (accountArray[i].getUid().equals(uid)) {
                if (accountArray[i].getUsername().equals(username) && accountArray[i].getName().equals(name) && accountArray[i].getEmail().equals(email)) {
                    return new ResponseEntity<>(accountArray[i], HttpStatus.OK);
                } else {
                    Account updateAccount = new Account(accountArray[i].getId(), username, name, uid, email, accountArray[i].getPhone_number(), accountArray[i].getAddress());
                    accountService.updateAccount(updateAccount);
                    return new ResponseEntity<>(updateAccount, HttpStatus.OK);

                }

            }
        }
        Account newAccount = new Account(username, name, uid, email, null, null);
        accountService.createAccount(newAccount);
        return new ResponseEntity<>(newAccount, HttpStatus.CREATED);
    }

    @PostMapping("/login/updateAddressPhone")
    public ResponseEntity<Boolean> updateAddressPhone(@RequestBody DetailData detailData) throws ParseException {

        String uid = detailData.getUid();
        String phone_number = detailData.getPhone_number();
        String address = detailData.getAddress();

        List<Account> list = accountService.getAccount();
        Account[] accountArray = list.toArray(new Account[0]);

        for (int i = 0; i < accountArray.length; i++) {
            if (accountArray[i].getUid().equals(uid)) {
                Account updateAccount = new Account(accountArray[i].getId(), accountArray[i].getUsername(), accountArray[i].getName(), uid, accountArray[i].getEmail(), phone_number, address);
                accountService.updateAccount(updateAccount);
            }
        }
        return new ResponseEntity<>(true, HttpStatus.OK);
    }
}