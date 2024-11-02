package com.example.demospringbootapi.DL_Order;

import com.example.demospringbootapi.Account.AccountService;
import com.example.demospringbootapi.Order_Detail.Order_Detail;
import com.example.demospringbootapi.Order_Detail.Order_DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@RestController
@RequestMapping(path ="api")
public class DL_OrderController {

    private final DL_OrderService dl_orderService;
    private final AccountService accountService;

    private final Order_DetailService order_detailService;

    @Autowired
    public DL_OrderController(DL_OrderService dl_orderService, AccountService accountService, Order_DetailService order_detailService) {
        this.dl_orderService = dl_orderService;
        this.accountService = accountService;
        this.order_detailService = order_detailService;

    }


    @PostMapping("/order/createorder")
    public ResponseEntity<DL_Order> checkOrder(@RequestBody DL_OrderData orderData) {
        String uid = orderData.getUid();
        String state = orderData.getState();
        String address = orderData.getAddress();
        String note = orderData.getNote();
        String paymentMethod = orderData.getPaymentMethod();;
        Long totalCost = Long.parseLong(orderData.getTotalcost());
        Long totalCost_vat = Long.parseLong(orderData.getTotalcostVAT());
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            formatter.setTimeZone(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
            Date order_date = formatter.parse(orderData.getOrderDate());
            DL_Order newOrd = new DL_Order(accountService.getAccountByUid(uid).getId(), uid, totalCost, state, address, note, totalCost_vat, paymentMethod, order_date);
            dl_orderService.createOrder(newOrd);
            return new ResponseEntity<>(newOrd, HttpStatus.CREATED);

        } catch (ParseException e) {
            // Xử lý ngoại lệ tại đây
            e.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.BAD_GATEWAY);
    }

    @GetMapping ("/order/updateorder/{ordid}")
    public ResponseEntity<DL_Order> updateOrder(@PathVariable("ordid") Long ordid) {
        DL_Order updateOrder = dl_orderService.getDL_OrderByID(ordid);
        updateOrder.setTotal_cost(order_detailService.calcTotalCost(ordid));
        dl_orderService.updateTotalCost(updateOrder);
        return new ResponseEntity<>(updateOrder, HttpStatus.OK);
    }

    @GetMapping("/order/getorder/{id}")
    public ResponseEntity<DL_Order> getOrder(@PathVariable("id") Long id){
        return new ResponseEntity<>(dl_orderService.getDL_OrderByID(id),HttpStatus.OK);
    }

    @GetMapping("/order/getmaxorder")
    public ResponseEntity<DL_Order> getMaxOrder(){
        return new ResponseEntity<>(dl_orderService.getMaxDL_Order(),HttpStatus.OK);
    }

    @GetMapping("/order/{uid}")
    public ResponseEntity<List<DL_Order>> getOrdHistory(@PathVariable("uid") String uid){
        return new ResponseEntity<>(dl_orderService.ordHistory(uid),HttpStatus.OK);
    }

    @GetMapping("/order/cancelOrder/{id}")
    public ResponseEntity<Boolean> cancelOrder(@PathVariable("id") Long id){
        if(dl_orderService.cancleOrd(id)){
            return new ResponseEntity<>(true,HttpStatus.OK);
        }
        else{
            return new ResponseEntity<>(false,HttpStatus.NOT_ACCEPTABLE);
        }

    }

    @GetMapping("/order/confirmOrder/{id}")
    public ResponseEntity<Boolean> confirmOrder(@PathVariable("id") Long id){
        if(dl_orderService.confirmOrd(id)){
            return new ResponseEntity<>(true,HttpStatus.OK);
        }
        else{
            return new ResponseEntity<>(false,HttpStatus.NOT_ACCEPTABLE);
        }
    }

    @GetMapping("/order/completeOrder/{id}")
    public ResponseEntity<Boolean> completeOrder(@PathVariable("id") Long id){
        if(dl_orderService.completeOrd(id)){
            return new ResponseEntity<>(true,HttpStatus.OK);
        }
        else{
            return new ResponseEntity<>(false,HttpStatus.NOT_ACCEPTABLE);
        }
    }


    @GetMapping("/order/getAll")
    public ResponseEntity<List<DL_Order>> getAllOrder(){
        return new ResponseEntity<>(dl_orderService.getAllDL_Order(),HttpStatus.OK);
    }

}
