package com.liujiaming.oa.mapper;

import com.alibaba.fastjson.JSONObject;
import com.liujiaming.core.entity.BasePage;
import com.liujiaming.core.feign.admin.entity.SimpleUser;
import com.liujiaming.core.servlet.BaseMapper;
import com.liujiaming.oa.entity.PO.OaLog;
import com.liujiaming.oa.entity.PO.OaLogBulletin;
import com.liujiaming.oa.entity.VO.OaBusinessNumVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 工作日志表 Mapper 接口
 * </p>
 *
 * @author liujiaming
 * @since 2024-05-15
 */
public interface OaLogMapper extends BaseMapper<OaLog> {
    /**
     * 分页查询日志
     *
     * @param parse 分页参数
     * @param data  data
     * @return data
     */
    public BasePage<JSONObject> queryList(BasePage<JSONObject> parse, @Param("data") JSONObject data);

    /**
     * 查询日志统计信息
     *
     * @param userId    用户
     * @param beginTime 开始时间
     * @param endTime   结束时间
     * @return data
     */
    public JSONObject queryLogBulletin(@Param("userId") Long userId, @Param("beginTime") Date beginTime, @Param("endTime") Date endTime);

    /**
     * 查询查询日志完成情况统计
     *
     * @param object param
     * @return data
     */
    public Integer queryCompleteStats(JSONObject object);

    /**
     * 查询查询日志完成情况列表
     *
     * @param object param
     * @return data
     */
    public BasePage<JSONObject> queryCompleteOaLogList(BasePage<JSONObject> page, @Param("data") JSONObject object);

    public BasePage<JSONObject> queryLogBulletinByType(BasePage<JSONObject> page, @Param("data") JSONObject object);

    public BasePage<SimpleUser> queryIncompleteOaLogList(BasePage<SimpleUser> page, @Param("data") JSONObject object);

    public JSONObject queryBulletinByLog(@Param("userIds") List<Long> userIds);

    public List<OaLogBulletin> queryBulletinByLogInfo(@Param("userIds") List<Long> userIds);

    public List<JSONObject> queryLogRecordCount(@Param("typeIds") List<Integer> typeIds);

    public JSONObject queryById(Integer logId);

    public List<JSONObject> queryExportList(JSONObject object);

    public List<JSONObject> queryCommentList(@Param("typeId") Integer typeId);

    public OaBusinessNumVO queryOaBusinessNum(Map<String,Object> map);
}
