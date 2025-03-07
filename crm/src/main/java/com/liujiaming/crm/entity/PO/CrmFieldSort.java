package com.liujiaming.crm.entity.PO;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Objects;

/**
 * <p>
 * 字段排序表
 * </p>
 *
 * @author liujiaming
 * @since 2024-05-19
 */
@Data
@Accessors(chain = true)
@TableName("wk_crm_field_sort")
@ApiModel(value="CrmFieldSort对象", description="字段排序表")
public class CrmFieldSort implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "字段ID")
    private Integer fieldId;

    @ApiModelProperty(value = "字段名称")
    private String fieldName;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "标签 1 线索 2 客户 3 联系人 4 产品 5 商机 6 合同 7回款8.回款计划 18 发票")
    private Integer label;

    @ApiModelProperty(value = "字段类型")
    private Integer type;

    @ApiModelProperty(value = "字段宽度")
    private Integer style;

    @ApiModelProperty(value = "字段排序")
    private Integer sort;

    @ApiModelProperty(value = "用户id")
    private Long userId;

    @ApiModelProperty(value = "是否隐藏 0、不隐藏 1、隐藏")
    private Integer isHide;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CrmFieldSort that = (CrmFieldSort) o;
        return fieldName.equals(that.fieldName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(fieldName);
    }
}
