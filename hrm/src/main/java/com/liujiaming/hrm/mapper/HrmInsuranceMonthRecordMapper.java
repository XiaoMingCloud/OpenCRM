package com.liujiaming.hrm.mapper;

import com.liujiaming.core.entity.BasePage;
import com.liujiaming.core.servlet.BaseMapper;
import com.liujiaming.hrm.entity.BO.QueryInsurancePageListBO;
import com.liujiaming.hrm.entity.BO.QueryInsuranceRecordListBO;
import com.liujiaming.hrm.entity.PO.HrmInsuranceMonthRecord;
import com.liujiaming.hrm.entity.VO.QueryInsurancePageListVO;
import com.liujiaming.hrm.entity.VO.QueryInsuranceRecordListVO;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 每月社保记录 Mapper 接口
 * </p>
 *
 * @author liujiaming
 * @since 2024-05-26
 */
public interface HrmInsuranceMonthRecordMapper extends BaseMapper<HrmInsuranceMonthRecord> {

    /**
     * 查询参保员工id
     * @return
     */
    List<Map<String,Integer>> queryInsuranceEmployee();

    BasePage<QueryInsuranceRecordListVO> queryInsuranceRecordList(BasePage<QueryInsuranceRecordListVO> parse,
                                                                  @Param("data") QueryInsuranceRecordListBO recordListBO,
                                                                  @Param("employeeIds") Collection<Integer> employeeIds,@Param("isAll") boolean isAll);

    BasePage<QueryInsurancePageListVO> queryInsurancePageList(BasePage<QueryInsurancePageListVO> parse,@Param("data") QueryInsurancePageListBO queryInsurancePageListBO,
                                                              @Param("employeeIds")Collection<Integer> employeeIds);

    QueryInsuranceRecordListVO queryInsuranceRecord(@Param("iRecordId") String iRecordId,@Param("employeeIds")Collection<Integer> employeeIds);

    List<Integer> queryDeleteEmpRecordIds(Integer iRecordId);
}
