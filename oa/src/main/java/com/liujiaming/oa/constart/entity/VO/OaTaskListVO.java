package com.liujiaming.oa.constart.entity.VO;

import com.liujiaming.core.entity.BasePage;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;
import java.util.Map;

/**
 * @author liujiaming
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@ApiModel("办公任务列表信息")
public class OaTaskListVO {
    @ApiModelProperty("所有任务")
    private Integer allTask;

    @ApiModelProperty("已结束任务")
    private Integer stopTask;

    @ApiModelProperty("任务列表分页")
    private BasePage<TaskInfoVO> page;

    private List<Map<String, Object>> exportList;
}
