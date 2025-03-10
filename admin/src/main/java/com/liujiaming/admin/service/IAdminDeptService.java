package com.liujiaming.admin.service;

import com.liujiaming.admin.entity.BO.AdminDeptBO;
import com.liujiaming.admin.entity.BO.AdminDeptQueryBO;
import com.liujiaming.admin.entity.BO.DeptVO;
import com.liujiaming.admin.entity.PO.AdminDept;
import com.liujiaming.admin.entity.VO.AdminDeptVO;
import com.liujiaming.core.feign.admin.entity.SimpleDept;
import com.liujiaming.core.servlet.BaseService;

import java.util.List;

/**
 * <p>
 * 部门表 服务类
 * </p>
 *
 * @author liujiaming
 * @since 2024-04-27
 */
public interface IAdminDeptService extends BaseService<AdminDept> {

    /**
     * 查询部门树
     * @param queryBO 上级ID
     * @return data
     */
    public List<AdminDeptVO> queryDeptTree(AdminDeptQueryBO queryBO);

    /**
     * 查询部门下属部门
     * @param parentId 上级ID
     * @return data
     */
    public List<Integer> queryChildDept(Integer parentId);

    /**
     * 新增部门
     * @param adminDeptBO 部门信息
     */
    public void addDept(AdminDeptBO adminDeptBO);


    /**
     * 修改部门
     * @param adminDeptBO 部门信息
     */
    public void setDept(AdminDeptBO adminDeptBO);

    /**
     * 删除部门
     * @param deptId 部门ID
     */
    public void deleteDept(Integer deptId);

    /**
     * 根据部门ID获取部门名称
     * @param deptId 部门ID
     * @return data
     */
    public String getNameByDeptId(Integer deptId);

    /**
     * 根据ids查询部门信息
     *
     * @param ids id列表
     * @return data
     */
    public List<SimpleDept> queryDeptByIds(List<Integer> ids);

    List<DeptVO> queryDeptUserList();


}
