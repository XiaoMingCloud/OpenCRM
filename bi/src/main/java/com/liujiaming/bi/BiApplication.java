package com.liujiaming.bi;

import com.alicp.jetcache.anno.config.EnableCreateCacheAnnotation;
import com.alicp.jetcache.anno.config.EnableMethodCache;
import com.liujiaming.core.CoreApplication;
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
@EnableDiscoveryClient
@EnableFeignClients(basePackageClasses = {CoreApplication.class, BiApplication.class})
@ComponentScan(basePackageClasses = {CoreApplication.class, BiApplication.class})
@MapperScan(basePackages = "com.liujiaming.bi.mapper")
@EnableMethodCache(basePackages = "com.liujiaming.bi",order = -9999)
@EnableCreateCacheAnnotation
public class BiApplication {
	public static void main(String[] args) {
		System.setProperty("javax.xml.accessExternalSchema","all");
		System.setProperty("javax.xml.accessExternalDTD","all");
		SpringApplication.run(BiApplication.class, args);
	}
}
