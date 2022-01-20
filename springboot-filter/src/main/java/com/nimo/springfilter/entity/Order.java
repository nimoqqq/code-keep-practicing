package com.nimo.springfilter.entity;

import com.nimo.springfilter.common.Encryptable;
import lombok.Data;

@Data
public class Order implements Encryptable {

    private Long orderId;
}
