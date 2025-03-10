package com.liujiaming.examine.service;

import com.liujiaming.core.servlet.BaseService;
import com.liujiaming.examine.entity.PO.ExamineRecordOptional;

import java.util.List;

/**
 * <p>
 * 审核自选成员选择成员表 服务类
 * </p>
 *
 * @author liujiaming
 * @since 2024-12-02
 */
public interface IExamineRecordOptionalService extends BaseService<ExamineRecordOptional> {

    /**
     * 保存自选成员审批对象
     * @param flowId 审批流程ID
     * @param recordId 审批记录ID
     * @param userList 用户列表
     */
    public void saveRecordOptionalInfo(Integer flowId, Integer recordId, List<Long> userList);
}
