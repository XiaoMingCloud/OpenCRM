package com.liujiaming.bi.service;

import com.alibaba.fastjson.JSONObject;
import com.liujiaming.bi.entity.VO.ProductStatisticsVO;
import com.liujiaming.core.entity.BasePage;
import com.liujiaming.core.feign.crm.entity.BiParams;

import java.util.List;
import java.util.Map;

public interface BiService {
    /**
     * 产品销售情况统计
     * startTime 开始时间 endTime 结束时间 userId用户ID deptId部门ID
     */
    public BasePage<ProductStatisticsVO> queryProductSell(BiParams biParams);

    public List<Map<String, Object>> productSellExport(BiParams biParams);

    /**
     * 获取商业智能业绩目标完成情况
     *
     * @author liujiaming
     */
    public List<JSONObject> taskCompleteStatistics(String year, Integer status, Integer deptId, Long userId, Integer isUser);

    public List<Map<String, Object>> taskCompleteStatisticsExport(String year, Integer status, Integer deptId, Long userId, Integer isUser);
}
