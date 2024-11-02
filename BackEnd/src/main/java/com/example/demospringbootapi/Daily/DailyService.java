package com.example.demospringbootapi.Daily;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demospringbootapi.Daily.*;


import java.util.*;

@Service
public class DailyService {
    private final DailyRepo dailyRepo;

    @Autowired
    public DailyService(DailyRepo dailyRepo){
        this.dailyRepo = dailyRepo;
    }

    public List getDaily(){
        return dailyRepo.findAll();
    }
}
