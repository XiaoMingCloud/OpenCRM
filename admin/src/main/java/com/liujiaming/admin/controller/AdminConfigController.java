package com.liujiaming.admin.controller;

import cn.hutool.core.bean.BeanUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.liujiaming.admin.common.AdminCodeEnum;
import com.liujiaming.admin.common.AdminConst;
import com.liujiaming.admin.common.AdminModuleEnum;
import com.liujiaming.admin.common.log.AdminConfigLog;
import com.liujiaming.admin.entity.BO.AdminCompanyBO;
import com.liujiaming.admin.entity.BO.AdminInitDataBO;
import com.liujiaming.admin.entity.BO.LogWelcomeSpeechBO;
import com.liujiaming.admin.entity.BO.ModuleSettingBO;
import com.liujiaming.admin.entity.PO.AdminConfig;
import com.liujiaming.admin.entity.PO.AdminModelSort;
import com.liujiaming.admin.entity.PO.AdminUserConfig;
import com.liujiaming.admin.entity.VO.ModuleSettingVO;
import com.liujiaming.admin.service.IAdminConfigService;
import com.liujiaming.admin.service.IAdminModelSortService;
import com.liujiaming.admin.service.IAdminUserConfigService;
import com.liujiaming.core.common.*;
import com.liujiaming.core.common.log.BehaviorEnum;
import com.liujiaming.core.common.log.SysLog;
import com.liujiaming.core.common.log.SysLogHandler;
import com.liujiaming.core.utils.UserUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


/**
 *企业配置
 * @author liujiaming
 * @since 2024-04-27
 */
@RestController
@RequestMapping("/adminConfig")
@Api(tags = "系统配置接口")
@SysLog(logClass = AdminConfigLog.class)
public class AdminConfigController {

    @Autowired
    private IAdminConfigService adminConfigService;

    @Autowired
    private IAdminUserConfigService adminUserConfigService;

    @Autowired
    private IAdminModelSortService adminModelSortService;


    /**
     * 查询企业配置
     *
     * @return Result
     * @author liujiaming
     */
    @ApiOperation(value = "查询企业配置")
    @PostMapping("/queryAdminConfig")
    public Result<AdminCompanyBO> queryAdminConfig() {
        return R.ok(adminConfigService.queryAdminConfig());
    }




    /**
     * 设置企业基本信息
     * (企业后台-->企业首页)
     */
    @ApiOperation(value = "基本企业信息设置")
    @PostMapping("/setAdminConfig")
    @SysLogHandler(subModel = SubModelType.ADMIN_COMPANY_HOME,behavior = BehaviorEnum.UPDATE,object = "企业首页配置",detail = "'企业首页配置:'+#adminCompanyBO.companyName")
    public Result setAdminConfig(@RequestBody AdminCompanyBO adminCompanyBO) {
        adminConfigService.setAdminConfig(adminCompanyBO);
        return Result.ok();
    }


    /**
     * 首页那里查询头部的一排
     * @return
     */
    @ApiOperation(value = "查询头部设置")
    @PostMapping("/queryHeaderModelSort")
    public Result<List<String>> queryHeaderModelSort() {
        List<AdminModelSort> list = adminModelSortService.lambdaQuery().select(AdminModelSort::getModel)
                .eq(AdminModelSort::getType, 1)
                .eq(AdminModelSort::getUserId, UserUtil.getUserId())
                .list();
        return Result.ok(list.stream().map(AdminModelSort::getModel).collect(Collectors.toList()));
    }

    @ApiOperation(value = "设置头部")
    @PostMapping("/setHeaderModelSort")
    public Result setHeaderModelSort(@RequestBody List<String> list) {
        List<AdminModelSort> modelSortList = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            AdminModelSort adminModelSort = new AdminModelSort();
            adminModelSort.setType(1).setModel(list.get(i)).setSort(i).setIsHidden(0).setUserId(UserUtil.getUserId());
            modelSortList.add(adminModelSort);
        }
        LambdaQueryWrapper<AdminModelSort> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(AdminModelSort::getType, 1).eq(AdminModelSort::getUserId, UserUtil.getUserId());
        adminModelSortService.remove(wrapper);
        adminModelSortService.saveBatch(modelSortList, Const.BATCH_SAVE_SIZE);
        return R.ok();
    }

    @ApiOperation(value = "设置活动咨询状态")
    @PostMapping("/setMarketing")
    @SysLogHandler(applicationName = "admin",subModel = SubModelType.ADMIN_OTHER_SETTINGS,behavior = BehaviorEnum.UPDATE,object = "活动咨询设置",detail = "活动咨询设置")
    public Result setMarketing(@RequestParam("status") Integer status) {
       adminConfigService.setMarketing(status);
       return R.ok();
    }


    @ApiOperation(value = "查询活动咨询状态")
    @PostMapping("/queryMarketing")
    public Result queryMarketing() {
        return R.ok(adminConfigService.queryMarketing());
    }

    /**
     * 查询应用模块配置(应用列表)
     *应用管理，首页那里都用
     * @author liujiaming
     */
    @ApiOperation(value = "查询应用模块配置(应用列表)")
    @PostMapping("/queryModuleSetting")
    public Result<List<ModuleSettingVO>> queryModuleSetting() {
        return R.ok(adminConfigService.queryModuleSetting());
    }

    /**
     * 设置企业模块 停用或者启用
     *
     * @param moduleSetting data
     */
    @ApiOperation(value = "设置企业模块 停用或者启用")
    @PostMapping("/setModuleSetting")
    @SysLogHandler(subModel = SubModelType.ADMIN_OTHER_SETTINGS,behavior = BehaviorEnum.UPDATE)
    public Result setModuleSetting(@Valid @RequestBody ModuleSettingBO moduleSetting) {

        AdminConfig adminConfig = adminConfigService.getById(moduleSetting.getSettingId());
        if (AdminModuleEnum.CRM.getValue().equals(adminConfig.getName())) {
            return R.error(AdminCodeEnum.ADMIN_MODULE_CLOSE_ERROR);
        }
        adminConfig.setStatus(moduleSetting.getStatus());
        adminConfigService.setModuleSetting(adminConfig);
        return Result.ok();
    }

    @ApiOperation(value = "设置日志欢迎语")
    @PostMapping("/setLogWelcomeSpeech")
    @SysLogHandler(subModel = SubModelType.ADMIN_OTHER_SETTINGS,behavior = BehaviorEnum.UPDATE,object = "设置日志欢迎语",detail = "设置日志欢迎语")
    public Result setLogWelcomeSpeech(@Valid @RequestBody List<String> stringList) {
        adminConfigService.setLogWelcomeSpeech(stringList);
        return Result.ok();
    }

    /**
     * 查询获取日志欢迎语列表
     *
     */
    @ApiOperation(value = "查询日志欢迎语列表")
    @PostMapping("/getLogWelcomeSpeechList")
    public Result<List<LogWelcomeSpeechBO>> getLogWelcomeSpeechList() {
        List<LogWelcomeSpeechBO> adminConfigs = adminConfigService.getLogWelcomeSpeechList();
        return R.ok(adminConfigs);
    }

    /**
     * 删除配置数据
     * （前端尚未开发）
     */
    @ApiOperation(value = "删除配置数据")
    @PostMapping("/deleteConfigById")
    public Result deleteConfigById(@RequestBody @ApiParam(name = "settingId", value = "主键ID", required = true) Integer settingId) {
        if (settingId == null) {
            return R.error(AdminCodeEnum.ADMIN_DATA_EXIST_ERROR);
        }
        adminConfigService.removeById(settingId);
        return R.ok();
    }

    /**
     * 查询呼叫中心设置
     */
    @ApiOperation(value = "查询手机端模块设置")
    @PostMapping("/queryCallModuleSetting")
    public Result<ModuleSettingVO> queryCallModuleSetting() {
        ModuleSettingVO moduleSettingVO = adminConfigService.queryCallModuleSetting();
        return R.ok(moduleSettingVO);
    }

    @ApiOperation(value = "查询自定义配置")
    @PostMapping("/queryCustomSetting/{customKey}")
    public Result<JSONArray> queryCustomSetting(@PathVariable("customKey") String customKey) {
        AdminUserConfig userConfig = adminUserConfigService.queryUserConfigByName(customKey);
        if (userConfig == null) {
            return Result.ok(new JSONArray());
        }
        return Result.ok(JSON.parseArray(userConfig.getValue()));
    }

    /**
     * 修改手机端模块设置
     */

    @ApiOperation(value = "修改自定义配置")
    @PostMapping("/setCustomSetting/{customKey}")
    public Result queryCustomSetting(@RequestBody JSONArray json,@PathVariable("customKey") String customKey) {
        AdminUserConfig userConfig = adminUserConfigService.queryUserConfigByName(customKey);
        if (userConfig != null) {
            userConfig.setValue(json.toJSONString());
            adminUserConfigService.updateById(userConfig);
        } else {
            userConfig = new AdminUserConfig();
            userConfig.setStatus(1);
            userConfig.setName(customKey);
            userConfig.setValue(json.toJSONString());
            userConfig.setUserId(UserUtil.getUserId());
            userConfig.setDescription("用户自定义参数设置");
            adminUserConfigService.save(userConfig);
        }
        return R.ok();
    }

    @ApiOperation(value = "设置跟进记录常用语")
    @PostMapping("/setActivityPhrase")
    public Result setActivityPhrase(@RequestBody List<String> stringList) {
        adminUserConfigService.setActivityPhrase(stringList);

        return R.ok();
    }

    /**
     * 企业后台-->客户管理-->业务参数->设置跟进记录类型
     * @param stringList
     * @return
     */
    @ApiOperation(value = "设置跟进记录类型")
    @PostMapping("/setRecordOptions")
    @SysLogHandler(subModel = SubModelType.ADMIN_OTHER_SETTINGS,behavior = BehaviorEnum.UPDATE,object = "设置跟进记录类型",detail = "设置跟进记录类型")
    public Result setRecordOptions(@RequestBody List<String> stringList) {
        adminConfigService.setRecordOptions(stringList);
        return R.ok();
    }


    /**
     * 企业后台-->客户管理-->业务参数->查询跟进记录常用语
     */
    @ApiOperation(value = "查询跟进记录常用语")
    @PostMapping("/queryActivityPhrase")
    public Result<List<String>> queryActivityPhrase() {
        String name = "ActivityPhrase";
        List<AdminUserConfig> adminConfigList = adminUserConfigService.queryUserConfigListByName(name);
        return Result.ok(adminConfigList.stream().map(AdminUserConfig::getValue).collect(Collectors.toList()));
    }

    @ApiExplain(value = "查询config配置")
    @RequestMapping("/queryConfigByName")
    public Result<List<com.liujiaming.core.feign.admin.entity.AdminConfig>> queryConfigByName(@RequestParam("name") String name) {
        List<AdminConfig> adminConfigs = adminConfigService.queryConfigListByName(name);
        return Result.ok(adminConfigs.stream().map(config -> BeanUtil.copyProperties(config, com.liujiaming.core.feign.admin.entity.AdminConfig.class)).collect(Collectors.toList()));
    }

    @ApiExplain(value = "查询config配置")
    @RequestMapping("/queryFirstConfigByName")
    public Result<com.liujiaming.core.feign.admin.entity.AdminConfig> queryFirstConfigByName(@RequestParam("name") String name, HttpServletRequest request) {
        AdminConfig config = adminConfigService.queryConfigByName(name);
        return Result.ok(BeanUtil.copyProperties(config, com.liujiaming.core.feign.admin.entity.AdminConfig.class));
    }

    @ApiExplain(value = "修改config配置")
    @PostMapping("/updateAdminConfig")
    public Result updateAdminConfig(@RequestBody AdminConfig adminConfig) {
        adminConfigService.updateAdminConfig(adminConfig);
        return R.ok();
    }

    @ApiExplain(value = "查询config配置")
    @RequestMapping("/queryFirstConfigByNameAndValue")
    public Result<com.liujiaming.core.feign.admin.entity.AdminConfig> queryFirstConfigByNameAndValue(@RequestParam("name") String name, @RequestParam("value") String value) {
        AdminConfig config = adminConfigService.queryFirstConfigByNameAndValue(name, value);
        return Result.ok(BeanUtil.copyProperties(config, com.liujiaming.core.feign.admin.entity.AdminConfig.class));
    }

    /**
     * 验证密码，初始化模块前需要验证密码
     */
    @ApiOperation(value = "验证密码")
    @PostMapping("/verifyPassword")
    public Result<String> verifyPassword(@RequestBody AdminInitDataBO adminInitDataBO) {
        return Result.ok(adminConfigService.verifyPassword(adminInitDataBO));
    }



    @ApiOperation(value = "模块初始化")
    @PostMapping("/moduleInitData")
    public Result<Boolean> moduleInitData(@RequestBody AdminInitDataBO adminInitDataBO) {
        return Result.ok(adminConfigService.moduleInitData(adminInitDataBO));
    }
}

