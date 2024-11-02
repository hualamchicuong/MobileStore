package com.example.demospringbootapi.Daily;

import java.util.*;
import javax.persistence.*;
import com.example.demospringbootapi.Daily.*;


@Entity
@Table(name = "Daily")
public class Daily {
    @Id
    @SequenceGenerator(
            name = "daily_sequence",
            sequenceName = "daily_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.IDENTITY,
            generator = "daily_sequence"
    )

    private int id;

    @Column(name="name")
    private String name;

    @Column(name="email")
    private String email;

    @Column(name="sdt")
    private String sdt;

    public Daily(){

    }

    public Daily(int id, String name, String email, String sdt) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.sdt = sdt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }
}
