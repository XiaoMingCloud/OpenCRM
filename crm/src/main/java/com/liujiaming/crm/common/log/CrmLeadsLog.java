package com.liujiaming.crm.common.log;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.liujiaming.core.common.FieldEnum;
import com.liujiaming.core.common.log.BehaviorEnum;
import com.liujiaming.core.common.log.Content;
import com.liujiaming.core.feign.admin.entity.SimpleDept;
import com.liujiaming.core.feign.admin.entity.SimpleUser;
import com.liujiaming.core.feign.admin.service.AdminFileService;
import com.liujiaming.core.feign.admin.service.AdminService;
import com.liujiaming.core.servlet.ApplicationContextHolder;
import com.liujiaming.core.servlet.upload.FileEntity;
import com.liujiaming.core.utils.TagUtil;
import com.liujiaming.core.utils.UserCacheUtil;
import com.liujiaming.crm.constant.CrmTypeEnum;
import com.liujiaming.crm.entity.BO.CrmModelSaveBO;
import com.liujiaming.crm.entity.BO.CrmUpdateInformationBO;
import com.liujiaming.crm.entity.PO.CrmLeads;
import com.liujiaming.crm.entity.PO.CrmLeadsData;
import com.liujiaming.crm.service.ICrmLeadsDataService;
import com.liujiaming.crm.service.ICrmLeadsService;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class CrmLeadsLog {

    private SysLogUtil sysLogUtil = ApplicationContextHolder.getBean(SysLogUtil.class);

    private ICrmLeadsService crmLeadsService = ApplicationContextHolder.getBean(ICrmLeadsService.class);

    private AdminFileService adminFileService = ApplicationContextHolder.getBean(AdminFileService.class);

    private AdminService adminService = ApplicationContextHolder.getBean(AdminService.class);

    private ICrmLeadsDataService crmLeadsDataService = ApplicationContextHolder.getBean(ICrmLeadsDataService.class);

    public Content update(@RequestBody CrmModelSaveBO crmModel) {
        CrmLeads crmLeads = BeanUtil.copyProperties(crmModel.getEntity(), CrmLeads.class);
        String batchId = StrUtil.isNotEmpty(crmLeads.getBatchId()) ? crmLeads.getBatchId() : IdUtil.simpleUUID();
        sysLogUtil.updateRecord(crmModel.getField(), Dict.create().set("batchId", batchId).set("dataTableName", "wk_crm_leads_data"));
        return sysLogUtil.updateRecord(BeanUtil.beanToMap(crmLeadsService.getById(crmLeads.getLeadsId())), BeanUtil.beanToMap(crmLeads), CrmTypeEnum.LEADS, crmLeads.getLeadsName());
    }

    public List<Content> changeOwnerUser(List<Integer> leadsIds, Long newOwnerUserId) {
        List<Content> contentList = new ArrayList<>();
        for (Integer leadsId : leadsIds) {
            contentList.add(sysLogUtil.addConversionRecord(CrmTypeEnum.LEADS, newOwnerUserId, crmLeadsService.getById(leadsId).getLeadsName()));
        }
        return contentList;
    }


    public List<Content> transfer(List<Integer> leadsIds) {
        List<Content> contentList = new ArrayList<>();
        for (Integer leadsId : leadsIds) {
            CrmLeads leads = crmLeadsService.getById(leadsId);
            String leadsName = leads.getLeadsName();
            contentList.add(new Content(leadsName, "将线索\"" + leadsName + "\"转化为客户", BehaviorEnum.TRANSFER));
        }
        return contentList;
    }


    public List<Content> updateInformation(CrmUpdateInformationBO updateInformationBO) {
        List<Content> contentList = new ArrayList<>();
        String batchId = updateInformationBO.getBatchId();
        updateInformationBO.getList().forEach(record -> {
            CrmLeads oldLeads = crmLeadsService.getById(updateInformationBO.getId());
            Map<String, Object> oldLeadsMap = BeanUtil.beanToMap(oldLeads);
            if (record.getInteger("fieldType") == 1) {
                Map<String, Object> crmLeadsMap = new HashMap<>(oldLeadsMap);
                crmLeadsMap.put(record.getString("fieldName"), record.get("value"));
                CrmLeads crmLeads = BeanUtil.mapToBean(crmLeadsMap, CrmLeads.class, true);
                contentList.add(sysLogUtil.updateRecord(oldLeadsMap, crmLeadsMap, CrmTypeEnum.LEADS, crmLeads.getLeadsName()));
            } else if (record.getInteger("fieldType") == 0 || record.getInteger("fieldType") == 2) {
                String formType = record.getString("formType");
                if(formType == null){
                    return;
                }
                String oldFieldValue = crmLeadsDataService.lambdaQuery().select(CrmLeadsData::getValue).eq(CrmLeadsData::getFieldId, record.getInteger("fieldId"))
                        .eq(CrmLeadsData::getBatchId, batchId).one().getValue();
                String newValue = record.getString("value");
                if (formType.equals(FieldEnum.USER.getFormType()) || formType.equals(FieldEnum.SINGLE_USER.getFormType())) {
                    oldFieldValue = UserCacheUtil.getSimpleUsers(TagUtil.toLongSet(oldFieldValue)).stream().map(SimpleUser::getRealname).collect(Collectors.joining(","));
                    newValue = UserCacheUtil.getSimpleUsers(TagUtil.toLongSet(record.getString("value"))).stream().map(SimpleUser::getRealname).collect(Collectors.joining(","));
                } else if (formType.equals(FieldEnum.STRUCTURE.getFormType())) {
                    oldFieldValue = adminService.queryDeptByIds(TagUtil.toSet(oldFieldValue)).getData().stream().map(SimpleDept::getName).collect(Collectors.joining(","));
                    newValue = adminService.queryDeptByIds(TagUtil.toSet(record.getString("value"))).getData().stream().map(SimpleDept::getName).collect(Collectors.joining(","));
                } else if (formType.equals(FieldEnum.FILE.getFormType())) {
                    oldFieldValue = adminFileService.queryFileList(oldFieldValue).getData().stream().map(FileEntity::getName).collect(Collectors.joining(","));
                    newValue = adminFileService.queryFileList(record.getString("value")).getData().stream().map(FileEntity::getName).collect(Collectors.joining(","));
                }
                String oldValue = StrUtil.isEmpty(oldFieldValue) ? "空" : oldFieldValue;
                String detail = "将" + record.getString("name") + " 由" + oldValue + "修改为" + newValue + "。";
                contentList.add(new Content(oldLeads.getLeadsName(), detail, BehaviorEnum.UPDATE));
            }
        });
        return contentList;
    }


    public List<Content> deleteByIds(List<Integer> ids) {
        List<Content> contentList = new ArrayList<>();
        for (Integer id : ids) {
            CrmLeads crmLeads = crmLeadsService.lambdaQuery().select(CrmLeads::getLeadsName).eq(CrmLeads::getLeadsId, id).one();
            if (crmLeads != null) {
                String name = crmLeads.getLeadsName();
                contentList.add(sysLogUtil.addDeleteActionRecord(CrmTypeEnum.LEADS, name));
            }
        }
        return contentList;
    }
}
