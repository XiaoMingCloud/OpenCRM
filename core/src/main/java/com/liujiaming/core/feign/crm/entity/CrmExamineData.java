package com.liujiaming.core.feign.crm.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author liujiaming
 */
@Data
@Accessors(chain = true)
public class CrmExamineData {
    private Integer recordId;
    private Integer status;
    private List<Long> examineLogIdList;
}
