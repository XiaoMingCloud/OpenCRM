package com.liujiaming.examine.entity.VO;

import com.liujiaming.core.feign.crm.entity.SimpleCrmInfo;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * @author liujiaming
 * @date 2024/12/25
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ExamineRecordInfoVO extends SimpleCrmInfo {

    private Integer logId;

    @ApiModelProperty(value = "审批ID")
    private Long examineId;

    @ApiModelProperty(value = "审批流程ID")
    private Integer flowId;

    @ApiModelProperty(value = "审批记录ID")
    private Integer recordId;

    @ApiModelProperty(value = "1 依次审批 2 会签 3 或签")
    private Integer type;

    @ApiModelProperty(value = "备注")
    private String remarks;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    @ApiModelProperty(value = "审核状态0待审核、1通过、2拒绝、3审核中 4:撤回 5 未提交 6 创建 7 已删除 8 作废")
    private Integer examineStatus;

    @ApiModelProperty(value = "审核人ID")
    private Long examineUserId;

    @ApiModelProperty(value = "审核角色ID")
    private Integer examineRoleId;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "修改时间")
    private Date updateTime;

    @ApiModelProperty(value = "批次ID")
    private String batchId;
}
