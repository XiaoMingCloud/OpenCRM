package com.liujiaming.oa.constart.entity.BO;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author liujiaming
 */
@Data
@ApiModel("任务状态参数")
public class WorkTaskStatusBO {

    @ApiModelProperty("任务id")
    private Integer taskId;

    @ApiModelProperty("状态")
    private Integer status;
}
