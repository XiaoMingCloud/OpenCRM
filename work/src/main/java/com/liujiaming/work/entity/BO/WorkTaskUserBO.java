package com.liujiaming.work.entity.BO;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author liujiaming
 */
@Data
@ApiModel("任务员工参数")
public class WorkTaskUserBO {

    @ApiModelProperty("任务id")
    private Integer taskId;

    @ApiModelProperty("员工id")
    private Long userId;
}
