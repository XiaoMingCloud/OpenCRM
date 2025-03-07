package com.liujiaming.hrm.service.impl;

import com.liujiaming.core.servlet.BaseServiceImpl;
import com.liujiaming.hrm.entity.PO.HrmAchievementEmployeeEvaluatoSeg;
import com.liujiaming.hrm.entity.PO.HrmAchievementEmployeeSeg;
import com.liujiaming.hrm.entity.PO.HrmAchievementEmployeeSegItem;
import com.liujiaming.hrm.entity.PO.HrmEmployee;
import com.liujiaming.hrm.mapper.HrmAchievementEmployeeSegMapper;
import com.liujiaming.hrm.service.IHrmAchievementEmployeeEvaluatoSegService;
import com.liujiaming.hrm.service.IHrmAchievementEmployeeSegItemService;
import com.liujiaming.hrm.service.IHrmAchievementEmployeeSegService;
import com.liujiaming.hrm.service.IHrmEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 员工绩效考核项 服务实现类
 * </p>
 *
 * @author huangmingbo
 * @since 2024-05-12
 */
@Service
public class HrmAchievementEmployeeSegServiceImpl extends BaseServiceImpl<HrmAchievementEmployeeSegMapper, HrmAchievementEmployeeSeg> implements IHrmAchievementEmployeeSegService {

    @Autowired
    private IHrmAchievementEmployeeSegItemService employeeSegItemService;

    @Autowired
    private IHrmAchievementEmployeeEvaluatoSegService employeeEvaluatoSegService;

    @Autowired
    private IHrmEmployeeService employeeService;

    @Override
    public List<HrmAchievementEmployeeSeg> queryAppraisalSeg(Integer employeeAppraisalId) {
        List<HrmAchievementEmployeeSeg> hrmAchievementEmployeeSegList = lambdaQuery()
                .eq(HrmAchievementEmployeeSeg::getEmployeeAppraisalId, employeeAppraisalId).orderByAsc(HrmAchievementEmployeeSeg::getSort).list();
        hrmAchievementEmployeeSegList.forEach(employeeSeg->{
            //考核子项
            List<HrmAchievementEmployeeSegItem> employeeSegItems = employeeSegItemService.lambdaQuery()
                    .eq(HrmAchievementEmployeeSegItem::getSegId,employeeSeg.getSegId()).orderByAsc(HrmAchievementEmployeeSegItem::getSort).list();
            employeeSeg.setItems(employeeSegItems);
            //考核项评定结果
            List<HrmAchievementEmployeeEvaluatoSeg> evaluatoSegList = employeeEvaluatoSegService.lambdaQuery().eq(HrmAchievementEmployeeEvaluatoSeg::getSegId,employeeSeg.getSegId())
                    .eq(HrmAchievementEmployeeEvaluatoSeg::getEmployeeAppraisalId,employeeAppraisalId)
                    .orderByAsc(HrmAchievementEmployeeEvaluatoSeg::getUpdateTime).list();
            evaluatoSegList.forEach(evaluatoSeg->{
                String employeeName = employeeService.lambdaQuery().select(HrmEmployee::getEmployeeName).eq(HrmEmployee::getEmployeeId, evaluatoSeg.getEmployeeId()).last("limit 1").one().getEmployeeName();
                evaluatoSeg.setEmployeeName(employeeName);
            });
            employeeSeg.setEvaluatoSegList(evaluatoSegList);
        });
        return hrmAchievementEmployeeSegList;
    }
}
