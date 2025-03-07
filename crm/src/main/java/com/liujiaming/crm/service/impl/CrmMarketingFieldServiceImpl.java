package com.liujiaming.crm.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.liujiaming.core.common.Const;
import com.liujiaming.core.common.FieldEnum;
import com.liujiaming.core.common.Result;
import com.liujiaming.core.exception.CrmException;
import com.liujiaming.core.feign.admin.entity.SimpleDept;
import com.liujiaming.core.feign.admin.entity.SimpleUser;
import com.liujiaming.core.feign.admin.service.AdminFileService;
import com.liujiaming.core.feign.admin.service.AdminService;
import com.liujiaming.core.servlet.BaseServiceImpl;
import com.liujiaming.core.servlet.upload.FileEntity;
import com.liujiaming.core.utils.TagUtil;
import com.liujiaming.core.utils.UserCacheUtil;
import com.liujiaming.crm.constant.CrmCodeEnum;
import com.liujiaming.crm.entity.BO.MarketingFieldBO;
import com.liujiaming.crm.entity.PO.CrmMarketingField;
import com.liujiaming.crm.mapper.CrmMarketingFieldMapper;
import com.liujiaming.crm.service.ICrmMarketingFieldService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author liujiaming
 * @date 2024/12/2
 */
@Service
public class CrmMarketingFieldServiceImpl extends BaseServiceImpl<CrmMarketingFieldMapper, CrmMarketingField> implements ICrmMarketingFieldService {

    @Autowired
    private AdminService adminService;

    @Autowired
    private AdminFileService adminFileService;


    @Override
    public List<CrmMarketingField> queryField(Integer id) {
        List<CrmMarketingField> list = lambdaQuery().eq(CrmMarketingField::getFormId, id).orderByAsc(CrmMarketingField::getSorting).list();
        recordToFormType(list);
        return list;
    }

    @Override
    public void recordToFormType(List<CrmMarketingField> list) {
        for (CrmMarketingField record : list) {
            FieldEnum typeEnum = FieldEnum.parse(record.getType());
            record.setFormType(typeEnum.getFormType());
            switch (typeEnum) {
                case CHECKBOX:
                    record.setDefaultValue(StrUtil.splitTrim((CharSequence) record.getDefaultValue(), Const.SEPARATOR));
                case SELECT:
                    record.setSetting(StrUtil.splitTrim(record.getOptions(), Const.SEPARATOR));
                    break;
                case USER:
                case STRUCTURE:
                    record.setDefaultValue(new ArrayList<>(0));
                    break;
                default:
                    record.setSetting(new ArrayList<>());
                    break;
            }
        }
    }


    @Override
    public void transferFieldList(List<CrmMarketingField> recordList, Integer isDetail) {
        recordList.forEach(record -> {
            Integer dataType = record.getType();
            if (isDetail == 2) {
                if (FieldEnum.USER.getType().equals(dataType)) {
                    if (ObjectUtil.isNotEmpty(record.getValue())) {
                        List<SimpleUser> listResult = UserCacheUtil.getSimpleUsers(TagUtil.toLongSet((String) record.getValue()));
                        record.setValue(listResult);
                    }
                } else if (FieldEnum.STRUCTURE.getType().equals(dataType)) {
                    if (ObjectUtil.isNotEmpty(record.getValue())) {
                        Result<List<SimpleDept>> listResult = adminService.queryDeptByIds(TagUtil.toSet((String) record.getValue()));
                        record.setValue(listResult.getData());
                    }
                }else if (FieldEnum.CHECKBOX.getType().equals(dataType)) {
                    if (ObjectUtil.isNotEmpty(record.getValue())) {
                        String[] split = StrUtil.split((String) record.getValue(), ",");
                        record.setValue(split);
                    }
                }
            } else {
                if (FieldEnum.USER.getType().equals(dataType)) {
                    if (ObjectUtil.isNotEmpty(record.getValue())) {
                        List<SimpleUser> listResult = UserCacheUtil.getSimpleUsers(TagUtil.toLongSet((String) record.getValue()));
                        String value = listResult.stream().map(SimpleUser::getRealname).collect(Collectors.joining(","));
                        record.setValue(value);
                    }
                } else if (FieldEnum.STRUCTURE.getType().equals(dataType)) {
                    if (ObjectUtil.isNotEmpty(record.getValue())) {
                        Result<List<SimpleDept>> listResult = adminService.queryDeptByIds(TagUtil.toSet((String) record.getValue()));
                        String value = listResult.getData().stream().map(SimpleDept::getName).collect(Collectors.joining(","));
                        record.setValue(value);
                    }
                }
            }
            if (dataType.equals(FieldEnum.FILE.getType())) {
                if (ObjectUtil.isNotEmpty(record.getValue())) {
                    Result<List<FileEntity>> fileList = adminFileService.queryFileList((String) record.getValue());
                    record.setValue(fileList.getData());
                }
            }
        });
    }

    @Override
    public void saveField(MarketingFieldBO marketingFieldBO) {
        List<CrmMarketingField> data = marketingFieldBO.getData();
        Map<String, List<CrmMarketingField>> collect = data.stream().collect(Collectors.groupingBy(CrmMarketingField::getName));
        for (Map.Entry<String, List<CrmMarketingField>> entry : collect.entrySet()) {
            if (entry.getValue().size() > 1) {
                throw new CrmException(CrmCodeEnum.THE_FIELD_NAME_OF_THE_FORM_CANNOT_BE_REPEATED);
            }
        }
        Integer formId = marketingFieldBO.getFormId();
        List<Integer> arr = data.stream().filter(oaExamineField -> oaExamineField.getFieldId() != null).map(CrmMarketingField::getFieldId).collect(Collectors.toList());
        if (arr.size() > 0) {
            getBaseMapper().deleteByChooseId(arr, formId);
        }
        for (int i = 0; i < data.size(); i++) {
            CrmMarketingField entity = data.get(i);
            entity.setUpdateTime(DateUtil.date());
            if (entity.getFieldType() == null || entity.getFieldType() == 0) {
                entity.setFieldName(entity.getName());
            }
            entity.setFormId(formId);
            entity.setSorting(i);
            if (entity.getFieldId() != null) {
                if (!(entity.getDefaultValue() instanceof String)) {
                    entity.setDefaultValue(entity.getDefaultValue().toString());
                }
                updateById(entity);
            } else {
                save(entity);
            }
        }
    }
}
