package com.liujiaming.oa;

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
@EnableFeignClients(basePackageClasses = {CoreApplication.class,OaApplication.class})
@ComponentScan(basePackageClasses = {CoreApplication.class, OaApplication.class})
@MapperScan(basePackages = "com.liujiaming.oa.mapper")
@EnableMethodCache(basePackages = "com.liujiaming.oa",order = -9999)
@EnableCreateCacheAnnotation
public class OaApplication {

	public static void main(String[] args) {
		System.setProperty("javax.xml.accessExternalSchema","all");
		System.setProperty("javax.xml.accessExternalDTD","all");
		SpringApplication.run(OaApplication.class, args);
	}
}
