package com.nimo.springbootmybatis.base;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PageData<T> implements Serializable {

    private long totalCount = 0;

    //结果集
    private List<T> items;
}
