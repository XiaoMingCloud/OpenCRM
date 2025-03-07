package com.liujiaming.crm.entity.PO;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 待办事项标记处理表
 * </p>
**/
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("wk_crm_back_log_deal")
@ApiModel(value="CrmBackLogDeal对象", description="待办事项已处理标记表")
public class CrmBackLogDeal implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "待办事项模块 1今日需联系客户 2分配给我的线索 3分配给我的客户 4待进入公海的客户 5待审核合同 6待审核回款 7待回款提醒 8即将到期的合同 9待回访合同 10待审核发票")
    private Integer model;

    @ApiModelProperty(value = "数据模块 1线索 2客户 3联系人 4产品 5商机  6合同  7回款  8回款计划 9公海 10市场活动  17客户回访 18发票 0null  ")
    private Integer crmType;

    @ApiModelProperty(value = "代办事项ID")
    private Integer typeId;

    @ApiModelProperty(value = "公海id")
    private Integer poolId;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    @ApiModelProperty(value = "创建人")
    @TableField(fill = FieldFill.INSERT)
    private Long createUserId;



}
