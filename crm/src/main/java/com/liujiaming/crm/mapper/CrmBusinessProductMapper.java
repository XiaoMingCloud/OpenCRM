package com.liujiaming.crm.mapper;

import com.liujiaming.core.servlet.BaseMapper;
import com.liujiaming.crm.entity.PO.CrmBusinessProduct;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 商机产品关系表 Mapper 接口
 * </p>
 *
 * @author liujiaming
 * @since 2024-05-27
 */
public interface CrmBusinessProductMapper extends BaseMapper<CrmBusinessProduct> {
    /**
     * 查询商机下产品
     * @param businessId 商机ID
     * @return data
     */
    public List<CrmBusinessProduct> queryList(@Param("businessId") Integer businessId);
}
