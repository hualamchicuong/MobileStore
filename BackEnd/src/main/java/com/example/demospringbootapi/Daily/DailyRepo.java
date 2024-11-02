package com.example.demospringbootapi.Daily;

import com.example.demospringbootapi.Daily.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DailyRepo extends JpaRepository<Daily, Long> {

}
