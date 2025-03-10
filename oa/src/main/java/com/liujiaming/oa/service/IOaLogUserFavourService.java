package com.liujiaming.oa.service;

import com.alibaba.fastjson.JSONObject;
import com.liujiaming.core.feign.admin.entity.SimpleUser;
import com.liujiaming.core.servlet.BaseService;
import com.liujiaming.oa.entity.PO.OaLogUserFavour;

import java.util.List;

/**
 * <p>
 * 用户点赞日志关系表  服务类
 * </p>
 *
 * @author liujiaming
 * @since 2021-03-02
 */
public interface IOaLogUserFavourService extends BaseService<OaLogUserFavour> {


    /**
     * 查询日志点赞用户列表
     * */
    List<SimpleUser> queryFavourLogUserList(Integer logId);

    /**
     * 判断当前用户是否已经对日志点赞
     * */
    boolean queryUserWhetherFavourLog(Integer logId);

    /**
     *  用户点赞或取消
     * */
    JSONObject userFavourOrCancel(boolean isFavour, Integer logId);




}
