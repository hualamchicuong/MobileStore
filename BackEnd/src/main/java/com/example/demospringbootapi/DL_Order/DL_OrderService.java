package com.example.demospringbootapi.DL_Order;

import com.example.demospringbootapi.Order_Detail.Order_Detail;
import com.example.demospringbootapi.Order_Detail.Order_DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class DL_OrderService {

    private final DL_OrderRepo dl_orderRepo;
    private final Order_DetailService order_detailService;

    @Autowired
    public DL_OrderService(DL_OrderRepo dl_orderRepo, Order_DetailService order_detailService){
        this.dl_orderRepo = dl_orderRepo;
        this.order_detailService = order_detailService;
    }

    public void createOrder(DL_Order newOrd){
        dl_orderRepo.save(newOrd);
    }

    public void updateTotalCost(DL_Order updated){
        dl_orderRepo.save(updated);
    }


    public List<DL_Order> getAllDL_Order(){
        return dl_orderRepo.findAll();
    }

    public DL_Order getDL_OrderByID(Long id){
        return dl_orderRepo.getReferenceById(id);
    }

    public DL_Order getMaxDL_Order(){
        return dl_orderRepo.findMaxDL_Order();
    }

    public List<DL_Order> ordHistory(String uid){
        return dl_orderRepo.findDL_OrderByUid(uid);
    }

    public Boolean cancleOrd(Long id){
        DL_Order updateOrd = dl_orderRepo.getReferenceById(id);
        if(updateOrd.getState().equals("Đã gửi")){
            updateOrd.setState("Đã hủy");
            dl_orderRepo.save(updateOrd);
            return true;
        }
        else{
            return false;
        }
    }

    public Boolean confirmOrd(Long id){
        DL_Order updateOrd = dl_orderRepo.getReferenceById(id);
        if(updateOrd.getState().equals("Đã gửi")){
            updateOrd.setState("Đang xử lý");
            dl_orderRepo.save(updateOrd);
            return true;
        }
        else{
            return false;
        }
    }

    public Boolean completeOrd(Long id){
        DL_Order updateOrd = dl_orderRepo.getReferenceById(id);
        if(updateOrd.getState().equals("Đang xử lý")){
            updateOrd.setState("Hoàn thành");
            dl_orderRepo.save(updateOrd);
            return true;
        }
        else{
            return false;
        }
    }


}
