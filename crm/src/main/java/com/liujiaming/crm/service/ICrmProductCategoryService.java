package com.liujiaming.crm.service;

import com.alicp.jetcache.anno.CacheType;
import com.alicp.jetcache.anno.Cached;
import com.liujiaming.core.servlet.BaseService;
import com.liujiaming.crm.entity.BO.CrmProductCategoryBO;
import com.liujiaming.crm.entity.PO.CrmProductCategory;

import java.util.List;

/**
 * <p>
 * 产品分类表 服务类
 * </p>
 *
 * @author liujiaming
 * @since 2024-05-26
 */
public interface ICrmProductCategoryService extends BaseService<CrmProductCategory> {
    /**
     * 通过ID查询
     *
     * @param id id
     * @return data
     */
    public CrmProductCategory queryById(Integer id);

    /**
     * 保存数据
     *
     * @param productCategory data
     */
    public void saveAndUpdate(CrmProductCategory productCategory);

    /**
     * 删除
     *
     * @param id id
     */
    public void deleteById(Integer id);

    /**
     * 查询产品类别列表
     *
     * @param type pid
     * @return data
     */
    public List<CrmProductCategoryBO> queryList(String type);

    /**
     * 查询产品类别名称列表
     *
     * @return data
     */
    public List<Object> queryListName();

    /**
     * 通过名称查询产品类别
     *
     * @param name name
     * @return data
     */
    @Cached(expire = 3600, cacheType = CacheType.REMOTE)
    public CrmProductCategory queryFirstCategoryByName(String name);

    String getProductCategoryName(int categoryId);

    public List<Integer> queryId(List<Integer> list,Integer categoryId);
}
