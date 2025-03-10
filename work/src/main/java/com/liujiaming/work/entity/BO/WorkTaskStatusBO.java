package com.liujiaming.work.entity.BO;

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

    @ApiModelProperty("状态1未完成 5完成  ")
    private Integer status;
}
