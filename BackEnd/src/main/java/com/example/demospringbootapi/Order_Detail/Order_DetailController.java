package com.example.demospringbootapi.Order_Detail;

import com.example.demospringbootapi.Account.Account;
import com.example.demospringbootapi.Cart_Detail.Cart_Detail;
import com.example.demospringbootapi.Cart_Detail.Cart_DetailService;
import com.example.demospringbootapi.DL_Order.DL_OrderService;
import com.example.demospringbootapi.Product.Product;
import com.example.demospringbootapi.Product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

import static org.springframework.data.repository.init.ResourceReader.Type.JSON;


@RestController
@RequestMapping(path ="api")
public class Order_DetailController {

    private final Order_DetailService order_detailService;
    private final Cart_DetailService cart_detailService;

    private final ProductService productService;

    private final DL_OrderService dl_orderService;

    @Autowired
    public Order_DetailController(Order_DetailService order_detailService, Cart_DetailService cart_detailService,DL_OrderService dl_orderService, ProductService productService){
        this.order_detailService = order_detailService;
        this.cart_detailService = cart_detailService;
        this.dl_orderService = dl_orderService;
        this.productService = productService;
    }

    @PostMapping("/order/detail/getorderdetail")
    public ResponseEntity<Order_Detail> checkOrderDetail(@RequestBody Order_DetailData order_detailData){
        int id_order = order_detailData.getId_order();
        int id_product = order_detailData.getId_product();
        int quantity = order_detailData.getQuantity();
        Product product = productService.getProductById((long) id_product);
        product.setQuantity(product.getQuantity() - quantity);
        productService.updateProduct(product);


        Long cost = product.getPrice() * (long) quantity;


        Order_Detail newOrdDetail = new Order_Detail(id_order,id_product,quantity,cost);
        order_detailService.InsertOrderDetail(newOrdDetail);

        return new ResponseEntity<>(newOrdDetail,HttpStatus.CREATED);
    }

    @GetMapping("/order/detail/{orderid}")
    public ResponseEntity<List<Order_Detail>> getAllOrderDetailOfAnOrder(@PathVariable("orderid") int orderid){
        return new ResponseEntity<>(order_detailService.getAllOrderDetailByOrderId(orderid),HttpStatus.OK);
    }

    @GetMapping("/order/cancelOrderDetail/{id}")
    public ResponseEntity<Boolean> cancelOrder(@PathVariable("id") int id){

        List<Order_Detail> listOrdDetail = order_detailService.getAllOrderDetailByOrderId(id);

        Order_Detail[]orderDetailArray = listOrdDetail.toArray(new Order_Detail[0]);

        for(int i=0;i<orderDetailArray.length;i++){
            int id_product = orderDetailArray[i].getId_product();
            int quantity = orderDetailArray[i].getQuantity();
            Product product = productService.getProductById((long) id_product);
            product.setQuantity(product.getQuantity() + quantity);
            productService.updateProduct(product);
        }

        return new ResponseEntity<>(true, HttpStatus.OK);


    }

}
