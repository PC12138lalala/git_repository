package com.guopc.itoken.service.redis.service;

public interface RedisService {
    /*
    * @Param key
    * @Param value
    * @Param second 超时时间
     */
    void put(String key,String value,long seconds);

    Object get(String key);
}
