package com.example.demospringbootapi.Daily;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.example.demospringbootapi.Daily.*;


@RestController
@RequestMapping(path ="api")
public class DailyController {
    private final DailyService dailyService;

    @Autowired
    public DailyController(DailyService dailyService) {
        this.dailyService = dailyService;
    }

    @GetMapping("/daily")

    public ResponseEntity<List<Daily>> listDaily(){
        List<Daily> list = dailyService.getDaily();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

}
