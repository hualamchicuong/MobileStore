package com.example.demospringbootapi.Order_Detail;

import com.example.demospringbootapi.Product.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class Order_DetailService {

    private final Order_DetailRepo order_detailRepo;

    @Autowired
    public Order_DetailService(Order_DetailRepo order_detailRepo){
        this.order_detailRepo = order_detailRepo;
    }

    public List<Order_Detail> getAllOrderDetailByOrderId(int order_id){
        return order_detailRepo.findOrder_DetailsById_order(order_id);
    }

    public List<Order_Detail> getAllOrderDetail(){
        return order_detailRepo.findAll();
    }

    public Product getProductByIdCartDetail(Long id_cart_detail){
        return order_detailRepo.findProductByIdCartDetail(id_cart_detail);
    }

//    public Order_Detail getOrderDetailByIdCartDetai(int id_cart_detail){
//        return order_detailRepo.findOrder_DetailById_cart_detail((long) id_cart_detail);
//    }

    public void UpdateOrderDetail(Order_Detail update) {
        order_detailRepo.save(update);
        int count =0;
        List<Order_Detail> listOrd = getAllOrderDetail();
        Order_Detail[] arrOrd = listOrd.toArray(new Order_Detail[0]);
        for(int i=0; i<arrOrd.length;i++){
            if (arrOrd[i].getId_product() == update.getId_product() && arrOrd[i].getId_order() == update.getId_order()) {
                count++;
                if(count >= 2) {
                    order_detailRepo.delete(arrOrd[i]);
                    count = 0;
                }
            }
        }
    }

    public void InsertOrderDetail(Order_Detail orderDetail){
        order_detailRepo.save(orderDetail);
    }

    public Long calcTotalCost(Long ordid){
        return order_detailRepo.calcTotalCostByIdOrder(ordid.intValue());
    }
}
