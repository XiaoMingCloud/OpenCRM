package com.liujiaming.core.feign.admin.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @author liujiaming
 * 简单的部门对象
 */
@Data
@ApiModel("简单部门对象")
public class SimpleDept implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty("id")
    private Integer id;

    @ApiModelProperty("名称")
    private String name;

}
