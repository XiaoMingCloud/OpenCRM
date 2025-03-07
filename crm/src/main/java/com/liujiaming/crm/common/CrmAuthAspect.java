package com.liujiaming.crm.common;

import cn.hutool.extra.servlet.ServletUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.liujiaming.core.common.R;
import com.liujiaming.core.common.SystemCodeEnum;
import com.liujiaming.core.common.cache.CrmCacheKey;
import com.liujiaming.core.exception.CrmException;
import com.liujiaming.core.utils.BaseUtil;
import com.liujiaming.core.utils.UserUtil;
import com.liujiaming.crm.constant.CrmAuthEnum;
import com.liujiaming.crm.constant.CrmTypeEnum;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * @author hmb
 * crm权限拦截切面
 */
@Aspect
@Component
@Slf4j
@Order(10)
public class CrmAuthAspect {


    @Around("execution(* com.liujiaming.crm.controller..*(..)) && execution(@(org.springframework.web.bind.annotation.*Mapping) * *(..)) && !execution(@(com.liujiaming.core.common.ParamAspect) * *(..))")
    public Object before(ProceedingJoinPoint point) throws Throwable {
        ServletRequestAttributes attributes = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes());
        HttpServletRequest request = attributes.getRequest();
        String requestURI = request.getRequestURI();
        String[] split = requestURI.split("/");
        Long userId = UserUtil.getUserId();
        boolean flag = false;
        CrmTypeEnum crmTypeEnum = CrmTypeEnum.parse(split[1].substring(3).toUpperCase());
        if (crmTypeEnum  != CrmTypeEnum.NULL && !userId.equals(UserUtil.getSuperUser())) {
            if ("add".equals(split[2]) || "update".equals(split[2])) {
                JSONObject jsonObject = JSON.parseObject(ServletUtil.getBody(request));
                Integer id = Optional.ofNullable(jsonObject.getJSONObject("entity")).orElse(new JSONObject()).getInteger(crmTypeEnum.getPrimaryKey());
                if(id != null){
                    BaseUtil.getRedis().del(CrmCacheKey.CRM_BACKLOG_NUM_CACHE_KEY + UserUtil.getUserId().toString());
                    flag = AuthUtil.isRwAuth(id,crmTypeEnum, CrmAuthEnum.EDIT);
                }

            } else if ("deleteByIds".equals(split[2])) {
                if (!Arrays.asList("crmCustomerPool", "crmMarketing").contains(split[1])) {
                    BaseUtil.getRedis().del(CrmCacheKey.CRM_BACKLOG_NUM_CACHE_KEY + UserUtil.getUserId().toString());
                    List<Integer> idsArr = JSON.parseArray(ServletUtil.getBody(request), Integer.class);
                    for (Integer id : idsArr) {
                        if (id != null) {
                            flag = AuthUtil.isCrmAuth(crmTypeEnum, id,CrmAuthEnum.DELETE);
                        }
                    }
                }
            } else if ("queryById".equals(split[2])) {
                //客户公海单独处理
                if (!Arrays.asList("crmCustomer", "crmMarketing").contains(split[1])) {
                    flag = AuthUtil.isCrmAuth(crmTypeEnum, Integer.valueOf(split[3]),CrmAuthEnum.READ);
                }
            }
            if (flag) {
                if ("queryById".equals(split[2])) {
                    CrmModel crmModel = new CrmModel();
                    crmModel.put("dataAuth",0);
                    return R.ok(crmModel);
                } else {
                    throw new CrmException(SystemCodeEnum.SYSTEM_NO_AUTH);
                }
            }
        }
        return point.proceed();
    }
}
