package com.guopc.itoken.service.sso;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication(scanBasePackages = "com.guopc.itoken")
@EnableEurekaClient
@EnableDiscoveryClient
@EnableFeignClients
@MapperScan(basePackages = "com.guopc.itoken.service.sso.mapper")
public class SsoServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(SsoServiceApplication.class, args);
    }
}
