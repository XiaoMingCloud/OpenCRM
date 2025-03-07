package com.liujiaming.hrm.mapper;

import com.liujiaming.core.servlet.BaseMapper;
import com.liujiaming.hrm.entity.BO.QueryNotesStatusBO;
import com.liujiaming.hrm.entity.PO.HrmNotes;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 备忘 Mapper 接口
 * </p>
 *
 * @author liujiaming
 * @since 2024-07-13
 */
public interface HrmNotesMapper extends BaseMapper<HrmNotes> {

    List<HrmNotes> queryNoteListByTime(@Param("time") Date time,@Param("employeeIds") Collection<Integer> employeeIds);

    Set<String> queryNoteStatusList(@Param("data")QueryNotesStatusBO queryNotesStatusBO,@Param("employeeIds") Collection<Integer> employeeIds);
}
