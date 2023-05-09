package com.nimo.design.creatation.singleton;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * 多例模式
 * @author : chuf
 * @date : 2023-05-09
 **/
public class BackendServer {

    private static final int SERVER_COUNT = 3;
    private static final Map<Long, BackendServer> SERVER_INSTANCES = new HashMap<>();

    private long serverNo;
    private String serverAddress;

    private BackendServer(long serverNo, String serverAddress) {
        this.serverNo = serverNo;
        this.serverAddress = serverAddress;
    }

    static {
        SERVER_INSTANCES.put(1L, new BackendServer(1L, "192.134.22.138:8080"));
        SERVER_INSTANCES.put(2L, new BackendServer(2L, "192.134.22.139:8080"));
        SERVER_INSTANCES.put(3L, new BackendServer(3L, "192.134.22.140:8080"));
    }

    public BackendServer getInstance() {
        Random random = new Random();
        int no = random.nextInt(SERVER_COUNT + 1);
        return SERVER_INSTANCES.get(no);
    }
}
