package com.liujiaming.admin;

import com.alibaba.cloud.sentinel.annotation.SentinelRestTemplate;
import com.alicp.jetcache.anno.config.EnableCreateCacheAnnotation;
import com.alicp.jetcache.anno.config.EnableMethodCache;
import com.liujiaming.core.CoreApplication;
import io.seata.spring.annotation.datasource.EnableAutoDataSourceProxy;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author liujiaming
 */
@SpringBootApplication
@EnableAutoDataSourceProxy
@EnableDiscoveryClient
@EnableFeignClients(basePackageClasses = {CoreApplication.class, AdminApplication.class})
@ComponentScan(basePackageClasses = {CoreApplication.class, AdminApplication.class})
@MapperScan(basePackages = "com.liujiaming.admin.mapper")
@EnableMethodCache(basePackages = "com.liujiaming.admin",order = -9999)
@EnableCreateCacheAnnotation
public class AdminApplication {
    public static void main(String[] args) {
        SpringApplication.run(AdminApplication.class, args);
    }
}
