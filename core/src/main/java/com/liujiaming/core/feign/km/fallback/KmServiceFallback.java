package com.liujiaming.core.feign.km.fallback;

import com.liujiaming.core.common.Result;
import com.liujiaming.core.feign.km.service.KmService;
import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class KmServiceFallback implements FallbackFactory<KmService> {
    @Override
    public KmService create(Throwable cause) {
        return new KmService() {
            @Override
            public Result<Boolean> initKmData() {
                log.error(cause.getMessage());
                return Result.ok(false);
            }
        };
    }
}
