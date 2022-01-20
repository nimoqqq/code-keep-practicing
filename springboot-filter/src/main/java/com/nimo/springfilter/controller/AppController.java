package com.nimo.springfilter.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimo.springfilter.entity.EncryptResponse;
import com.nimo.springfilter.entity.Order;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class AppController {

    private final ObjectMapper objectMapper;

    @PostMapping(value = "/e/order/save",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public EncryptResponse<Order> saveOrder(@RequestBody Order order) throws Exception {
        //这里忽略实际的业务逻辑,简单设置返回的data为一个map
        EncryptResponse<Order> response = new EncryptResponse<>();
        response.setCode(200);
        response.setData(order);
        return response;
    }

    @PostMapping(value = "/c/order/query",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<Order> queryOrder(@RequestBody Order order) {
        Order order1 = new Order();
        order1.setOrderId(1L);
        //这里忽略实际的业务逻辑
        return ResponseEntity.ok(order1);
    }
}
