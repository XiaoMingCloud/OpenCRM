package com.liujiaming.oa.constart.entity.BO;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author liujiaming
 */
@Data
@ApiModel("任务优先级参数")
public class WorkTaskPriorityBO {

    @ApiModelProperty("任务id")
    private Integer taskId;

    @ApiModelProperty("优先级")
    private Integer priority;
}
