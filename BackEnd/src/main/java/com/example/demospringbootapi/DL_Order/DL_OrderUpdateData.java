package com.example.demospringbootapi.DL_Order;

public class DL_OrderUpdateData {
    private Long ordID;



    public DL_OrderUpdateData(Long ordID) {
        this.ordID = ordID;
    }

    public DL_OrderUpdateData(){

    }

    public Long getOrdID() {
        return ordID;
    }

    public void setOrdID(Long ordID) {
        this.ordID = ordID;
    }
}
