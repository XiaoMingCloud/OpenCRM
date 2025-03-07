package com.liujiaming.admin.service;

import com.liujiaming.admin.entity.BO.AdminCompanyBO;
import com.liujiaming.admin.entity.BO.AdminInitDataBO;
import com.liujiaming.admin.entity.BO.LogWelcomeSpeechBO;
import com.liujiaming.admin.entity.PO.AdminConfig;
import com.liujiaming.admin.entity.VO.ModuleSettingVO;
import com.liujiaming.core.servlet.BaseService;

import java.util.List;

/**
 * <p>
 * 客户规则 服务类
 * </p>
 *
 * @author liujiaming
 * @since 2024-04-27
 */
public interface IAdminConfigService extends BaseService<AdminConfig> {

    /**
     * 通过name查询系统配置
     * @param names names
     * @return adminConfig
     */
    public List<AdminConfig> queryConfigListByName(Object... names);

    /**
     * 设置企业配置
     * @param adminConfig config
     */
    public void setAdminConfig(AdminCompanyBO adminConfig);

    /**
     * 查询企业配置
     * @return adminCompanyBO
     */
    public AdminCompanyBO queryAdminConfig();

    /**
     * 查询模块设置（应用模块）
     * @return data
     */
    public List<ModuleSettingVO> queryModuleSetting();

    /**
     * 设置模块的禁用启用
     * @param adminConfig data
     */
    public void setModuleSetting(AdminConfig adminConfig);

    /**
     * 设置日志欢迎语
     * @param stringList data
     */
    public void setLogWelcomeSpeech(List<String> stringList);

    /**
     * 查询日志欢迎语
     * @return data
     */
    public List<LogWelcomeSpeechBO> getLogWelcomeSpeechList();

    /**
     * 根据名称查询配置信息
     * @param name 名称
     * @return data
     */
    public AdminConfig queryConfigByName(String name);

    /**
     * 查询呼叫中心设置
     * @return data
     */
    public ModuleSettingVO queryCallModuleSetting();


    public void updateAdminConfig(AdminConfig adminConfig);

    AdminConfig queryFirstConfigByNameAndValue(String name, String value);

    void setMarketing(Integer status);

    Integer queryMarketing();


    /**
     * 验证密码
     * @param adminInitDataBO
     * @return
     */
    String verifyPassword(AdminInitDataBO adminInitDataBO);

    boolean moduleInitData(AdminInitDataBO adminInitDataBO);

    void setRecordOptions(List<String> stringList);
}
