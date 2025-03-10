package com.liujiaming.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.ReUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.BigExcelWriter;
import cn.hutool.poi.excel.ExcelUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.util.TypeUtils;
import com.alibaba.nacos.api.NacosFactory;
import com.alibaba.nacos.api.config.ConfigService;
import com.alibaba.nacos.api.exception.NacosException;
import com.alicp.jetcache.Cache;
import com.alicp.jetcache.anno.CreateCache;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.liujiaming.admin.common.AdminCodeEnum;
import com.liujiaming.admin.common.AdminConst;
import com.liujiaming.admin.entity.BO.*;
import com.liujiaming.admin.entity.PO.*;
import com.liujiaming.admin.entity.VO.AdminSuperUserVo;
import com.liujiaming.admin.entity.VO.AdminUserVO;
import com.liujiaming.admin.entity.VO.HrmSimpleUserVO;
import com.liujiaming.admin.entity.VO.UserBookVO;
import com.liujiaming.admin.mapper.AdminUserMapper;
import com.liujiaming.admin.service.*;
import com.liujiaming.core.common.*;
import com.liujiaming.core.entity.BasePage;
import com.liujiaming.core.entity.UserInfo;
import com.liujiaming.core.exception.CrmException;
import com.liujiaming.core.exception.NoLoginException;
import com.liujiaming.core.feign.admin.entity.SimpleUser;
import com.liujiaming.core.feign.crm.service.CrmService;
import com.liujiaming.core.feign.email.service.EmailService;
import com.liujiaming.core.feign.hrm.entity.HrmEmployee;
import com.liujiaming.core.feign.hrm.service.HrmService;
import com.liujiaming.core.servlet.ApplicationContextHolder;
import com.liujiaming.core.servlet.BaseServiceImpl;
import com.liujiaming.core.utils.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author liujiaming
 * @since 2024-04-27
 */
@Service
@Slf4j
public class AdminUserServiceImpl extends BaseServiceImpl<AdminUserMapper, AdminUser> implements IAdminUserService {

    @Autowired
    private IAdminRoleService adminRoleService;
    @Autowired
    private IAdminDeptService adminDeptService;
    @Autowired
    private IAdminUserConfigService adminUserConfigService;
    @Autowired
    private IAdminUserRoleService adminUserRoleService;
    @Autowired
    private IAdminAttentionService adminAttentionService;

    @Autowired
    private CrmService crmService;

    @Autowired
    private  IAdminDeptService iAdminDeptService;

    @Autowired
    private IAdminDeptService deptService;

    @CreateCache(name = Const.ADMIN_USER_NAME_CACHE_NAME, expire = 3, timeUnit = TimeUnit.DAYS)
    private Cache<Long, SimpleUser> userCache;


    /**
     * 根据用户名查用户
     * @param username
     * @return
     */
    @Override
    public List<Map<String, Object>> findByUsername(String username) {
       List<Map<String, Object>> userInfoList = getBaseMapper().findByUsername(username);
        return userInfoList;
    }

    /**
     * 查询企业下所有用户
     *
     * @param adminUserBO 业务对象
     * @return ids
     */
    @Override
    public BasePage<AdminUserVO> queryUserList(AdminUserBO adminUserBO) {
        if (adminUserBO == null) {
            BasePage<AdminUserVO> userBasePage = new BasePage<>();
            List<AdminUserVO> adminUserVOList = this.lambdaQuery().ne(AdminUser::getUserId, UserUtil.getSuperUser())
                    .list().stream().map(adminUser -> this.convertAdminUserToVo(adminUser, 2)).collect(Collectors.toList());
            //置顶超级管理员
            AdminUser adminSuperUser = this.getById(UserUtil.getSuperUser());
            adminUserVOList.add(0, this.convertAdminUserToVo(adminSuperUser, 0));
            userBasePage.setRecords(adminUserVOList);
            return userBasePage;
        }
        Long deptOwnerUserId = null;
        adminUserBO.setUserId(UserUtil.getSuperUser());
        if (adminUserBO.getDeptId() != null) {
            List<Integer> list;
            if (Objects.equals(adminUserBO.getIsNeedChild(), 1)) {
                list = adminDeptService.queryChildDept(adminUserBO.getDeptId());
            } else {
                list = new ArrayList<>();
            }
            list.add(adminUserBO.getDeptId());
            adminUserBO.setDeptIdList(list);
            deptOwnerUserId = adminDeptService.getById(adminUserBO.getDeptId()).getOwnerUserId();
            adminUserBO.setDeptOwnerUserId(deptOwnerUserId);
        }
        BasePage<AdminUserVO> basePage = getBaseMapper().queryUserList(adminUserBO.parse(), adminUserBO);
        //标识部门负责人
        if (deptOwnerUserId != null) {
            if (adminUserBO.getPage() == 1) {
                for (AdminUserVO adminUserVO : basePage.getRecords()) {
                    if (Objects.equals(adminUserVO.getUserId(), deptOwnerUserId)) {
                        adminUserVO.setUserIdentity(1);
                    }
                }
            }
        } else {
            //标识超级管理员
            if (adminUserBO.getPage() == 1) {
                for (AdminUserVO adminUserVO : basePage.getRecords()) {
                    if (Objects.equals(adminUserVO.getUserId(), UserUtil.getSuperUser())) {
                        adminUserVO.setUserIdentity(0);
                    }
                }
            }
        }
        LambdaQueryWrapper<AdminUserHisTable> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.select(AdminUserHisTable::getUserId);
        queryWrapper.eq(AdminUserHisTable::getHisTable,1);
        List<Long> longs = ApplicationContextHolder.getBean(IAdminUserHisTableService.class).listObjs(queryWrapper, user -> Long.valueOf(user.toString()));
        basePage.getRecords().forEach(adminUserVO -> {
            if(longs.contains(adminUserVO.getUserId())){
                adminUserVO.setHisTable(1);
            }
            List<AdminRole> adminRoleList = adminRoleService.queryRoleListByUserId(adminUserVO.getUserId());
            adminUserVO.setRoleId(adminRoleList.stream().map(adminRole -> adminRole.getRoleId().toString()).collect(Collectors.joining(",")));
            adminUserVO.setRoleName(adminRoleList.stream().map(AdminRole::getRoleName).collect(Collectors.joining(",")));
        });
        return basePage;
    }

    private AdminUserVO convertAdminUserToVo(AdminUser adminUser, Integer userIdentity) {
        AdminUserVO userVO = BeanUtil.copyProperties(adminUser, AdminUserVO.class);
        userVO.setUserIdentity(userIdentity);
        userVO.setDeptName(UserCacheUtil.getDeptName(userVO.getDeptId()));
        return userVO;
    }


    @Override
    public JSONObject countUserByLabel() {
        JSONObject jsonObject = new JSONObject();
        jsonObject
                //所有员工
                .fluentPut("allUserCount", getBaseMapper().countUserByLabel(0, null))
                //新加入的员工
                .fluentPut("addNewlyCount", getBaseMapper().countUserByLabel(1, null))
                //激活员工
                .fluentPut("activateCount", getBaseMapper().countUserByLabel(null, 1))
                //不活跃员工
                .fluentPut("inactiveCount", getBaseMapper().countUserByLabel(2, null))
                //禁用
                .fluentPut("disableCount", getBaseMapper().countUserByLabel(3, null));
        return jsonObject;
    }

    /**
     * 查询该用户下级的用户
     *
     * @param userId 用户ID 0代表全部
     * @return data
     */
    @Override
    public List<Long> queryChildUserId(Long userId) {
        return RecursionUtil.getChildList(list(), "parentId", userId, "userId", "userId");
    }


    /**
     * 新增或修改用户
     *
     * @param adminUserVO data
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void setUser(AdminUserVO adminUserVO) {
        if (adminUserVO.getParentId() == null) {
            adminUserVO.setParentId(0L);
        }
        List<Long> userList = queryChildUserId(adminUserVO.getUserId());
        if (userList.contains(adminUserVO.getParentId())) {
            throw new CrmException(AdminCodeEnum.ADMIN_PARENT_USER_ERROR);
        }
        if (adminUserVO.getUserId().equals(adminUserVO.getParentId())) {
            throw new CrmException(AdminCodeEnum.ADMIN_PARENT_USER_ERROR1);
        }
        //用户姓名处理
        Integer nameCount = query().eq("realname", adminUserVO.getRealname()).ne("user_id", adminUserVO.getUserId()).count();
        if (nameCount > 0) {
            throw new CrmException(AdminCodeEnum.ADMIN_USER_REAL_NAME_EXIST_ERROR);
        }
        //不修改用户名
        adminUserVO.setUsername(null);
        //不修改密码
        adminUserVO.setPassword(null);
        AdminUser adminUser = BeanUtil.copyProperties(adminUserVO, AdminUser.class);
        adminUserRoleService.saveByUserId(adminUserVO.getUserId(), true, StrUtil.splitTrim(adminUserVO.getRoleId(), Const.SEPARATOR));
        updateById(adminUser);
        crmService.batchUpdateEsData(adminUser.getUserId().toString(), adminUser.getRealname());
        Long key = adminUser.getUserId();
        userCache.put(key, new SimpleUser(adminUser.getUserId(),adminUser.getImg(),adminUser.getRealname(),adminUser.getDeptId(),adminDeptService.getNameByDeptId(adminUser.getDeptId())));
    }

    @Override
    public void setUserDept(AdminUserBO adminUserBO) {
        Integer deptId = adminUserBO.getDeptId();
        List<Long> userIdList = adminUserBO.getUserIdList();
        if (CollUtil.isEmpty(userIdList) || deptId == null) {
            return;
        }
        AdminDept dept = adminDeptService.getById(deptId);
        if (dept == null) {
            throw new CrmException(AdminCodeEnum.ADMIN_DEPT_NOT_EXIST_ERROR);
        }
        this.lambdaUpdate().set(AdminUser::getDeptId, deptId).in(AdminUser::getUserId, userIdList).update();
        for (Long userId : userIdList) {
            SimpleUser simpleUser = userCache.get(userId);
            if(simpleUser != null) {
                simpleUser.setDeptId(deptId);
                simpleUser.setDeptName(dept.getName());
                userCache.put(userId,simpleUser);
            }
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addUser(AdminUserVO adminUser) {
        if (adminUser.getParentId() == null) {
            adminUser.setParentId(0L);
        }
        if (!ReUtil.isMatch(AdminConst.DEFAULT_PASSWORD_INTENSITY, adminUser.getPassword())) {
            throw new CrmException(AdminCodeEnum.ADMIN_PASSWORD_INTENSITY_ERROR);
        }
        Integer count = query().eq("username", adminUser.getUsername()).count();
        if (count > 0) {
            throw new CrmException(AdminCodeEnum.ADMIN_USER_EXIST_ERROR);
        }
        Integer nameCount = query().eq("realname", adminUser.getRealname()).count();
        if (nameCount > 0) {
            throw new CrmException(AdminCodeEnum.ADMIN_USER_REAL_NAME_EXIST_ERROR);
        }
        String salt = IdUtil.fastSimpleUUID();
        AdminUser adminUserPO = BeanUtil.copyProperties(adminUser, AdminUser.class);
        adminUserPO.setCreateTime(new Date());
        adminUserPO.setNum(RandomUtil.randomNumbers(15));
        adminUserPO.setMobile(adminUserPO.getUsername());
        adminUserPO.setSalt(salt);
        adminUserPO.setPassword(UserUtil.sign((adminUser.getUsername().trim() + adminUser.getPassword().trim()), salt));
        save(adminUserPO);
        adminUserConfigService.initUserConfig(adminUserPO.getUserId());
        adminUserRoleService.saveByUserId(adminUserPO.getUserId(), false, StrUtil.splitTrim(adminUser.getRoleId(), Const.SEPARATOR));
        Long key = adminUserPO.getUserId();
        userCache.put(key, new SimpleUser(adminUserPO.getUserId(),adminUserPO.getImg(),adminUserPO.getRealname(),adminUserPO.getDeptId(),adminDeptService.getNameByDeptId(adminUserPO.getDeptId())));
    }

    /**
     * 修改用户信息
     *
     * @param adminUser
     */
    @Override
    public void updateUser(AdminUser adminUser) {
        if (!UserUtil.getUser().getUsername().equals(adminUser.getUsername())) {
            throw new CrmException(AdminCodeEnum.ADMIN_USERNAME_EDIT_ERROR);
        }
        adminUser.setUserId(UserUtil.getUserId());
        boolean b = false;
        if (StrUtil.isNotEmpty(adminUser.getPassword())) {
            if (!ReUtil.isMatch(AdminConst.DEFAULT_PASSWORD_INTENSITY, adminUser.getPassword())) {
                throw new CrmException(AdminCodeEnum.ADMIN_PASSWORD_INTENSITY_ERROR);
            }
            b = true;
            adminUser.setSalt(IdUtil.simpleUUID());
            adminUser.setPassword(UserUtil.sign((adminUser.getUsername().trim() + adminUser.getPassword().trim()), adminUser.getSalt()));
        }
        adminUser.setStatus(null);
        boolean update = updateById(adminUser);
        crmService.batchUpdateEsData(adminUser.getUserId().toString(), adminUser.getRealname());
        if (b && update) {
            UserUtil.userExit(adminUser.getUserId(), null);
        }
    }

    /**
     * 修改用户账号功能
     *
     * @param id       用户ID
     * @param username 新的用户名
     * @param password 新的密码
     * @return 操作状态
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Integer usernameEdit(Integer id, String username, String password) {
        if (!ReUtil.isMatch(AdminConst.DEFAULT_PASSWORD_INTENSITY, password)) {
            throw new CrmException(AdminCodeEnum.ADMIN_PASSWORD_INTENSITY_ERROR);
        }
        AdminUser adminUser = getById(id);
        if (adminUser == null) {
            throw new CrmException(AdminCodeEnum.ADMIN_USER_NOT_EXIST_ERROR);
        }
        if (adminUser.getUsername().equals(username)) {
            throw new CrmException(AdminCodeEnum.ADMIN_ACCOUNT_ERROR);
        }
        Integer count = lambdaQuery().eq(AdminUser::getUsername, username).count();
        if (count > 0) {
            throw new CrmException(AdminCodeEnum.ADMIN_PHONE_REGISTER_ERROR);
        }
        adminUser.setUsername(username);
        adminUser.setMobile(username);
        adminUser.setPassword(UserUtil.sign(username + password, adminUser.getSalt()));
        UserUtil.userExit(adminUser.getUserId(), null);
        updateById(adminUser);
        return null;
    }

    /**
     * excel导入员工
     *
     * @param file file
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public JSONObject excelImport(MultipartFile file) {
        List<List<Object>> errList = new ArrayList<>();
        String filePath = getFilePath(file);
        AtomicReference<Integer> num = new AtomicReference<>(0);
        ExcelUtil.readBySax(filePath, 0, (int sheetIndex, int rowIndex, List<Object> rowList) -> {
            if (rowIndex > 1) {
                num.getAndSet(num.get() + 1);
                if (StrUtil.isEmptyIfStr(rowList.get(0))) {
                    rowList.add(0, "用户名不能为空");
                    errList.add(rowList);
                    return;
                }
                if (StrUtil.isEmptyIfStr(rowList.get(1))) {
                    rowList.add(0, "密码不能为空");
                    errList.add(rowList);
                    return;
                }
                if (!ReUtil.isMatch("^(?=.*[a-zA-Z])(?=.*\\d).{6,20}$", rowList.get(1).toString())) {
                    rowList.add(0, "密码必须由 6-20位字母、数字组成");
                    errList.add(rowList);
                    return;
                }

                if (StrUtil.isEmptyIfStr(rowList.get(2))) {
                    rowList.add(0, "姓名不能为空");
                    errList.add(rowList);
                    return;
                } else {
                    Integer count = query().eq("realname", rowList.get(2).toString().trim()).count();
                    if (count > 0) {
                        rowList.add(0, "姓名重复");
                        errList.add(rowList);
                        return;
                    }
                }
                String username = rowList.get(0).toString().trim();
                Integer count = lambdaQuery().eq(AdminUser::getUsername, username).count();
                if (count > 0) {
                    rowList.add(0, "手机号已存在");
                    errList.add(rowList);
                    return;
                }
                if (!ReUtil.isMatch("^[1][3,4,5,6,7,8,9][0-9]{9}$", username)) {
                    rowList.add(0, "手机号格式不正确");
                    errList.add(rowList);
                    return;
                }
                AdminUser adminUser = new AdminUser();
                if(rowList.size() < 6){
                    rowList.add(0, "部门不能为空");
                    errList.add(rowList);
                    return;
                }
                String deptNames = Optional.ofNullable(rowList.get(5)).orElse("").toString().trim();
                if(!StrUtil.isEmpty(deptNames)){
                    String[] strArr = deptNames.split("/");
                    Integer deptId = null;
                    for (int i = 0; i < strArr.length; i++) {
                        AdminDept dept;
                        if (i == 0) {
                             dept = adminDeptService.lambdaQuery().select(AdminDept::getDeptId)
                                    .eq(AdminDept::getName, strArr[0])
                                    .last("limit 1").one();

                        }else {
                            dept = adminDeptService.lambdaQuery().select(AdminDept::getDeptId)
                                    .eq(AdminDept::getName, strArr[i]).eq(AdminDept::getPid,deptId)
                                    .last("limit 1").one();
                        }
                        if(dept == null){
                            Integer a = i + 1;
                            rowList.add(0, a +"级部门不存在");
                            errList.add(rowList);
                            return;
                        }
                        deptId = dept.getDeptId();
                    }

                    if(deptId == null){
                        rowList.add(0, "部门不存在");
                        errList.add(rowList);
                        return;
                    }
                    adminUser.setDeptId(deptId);

                }else {
                    rowList.add(0, "部门不能为空");
                    errList.add(rowList);
                    return;
                }

                String password = rowList.get(1).toString().trim();
                String realname = rowList.get(2).toString().trim();
                String sex = null;
                if (rowList.get(3) != null){
                     sex = Optional.ofNullable(rowList.get(3)).orElse("").toString().trim();
                }

                String email = null;
                if (rowList.get(4) != null){
                    email = Optional.ofNullable(rowList.get(4)).orElse("").toString().trim();
                }
                String post = null;
                if (rowList.size() > 6){
                    post = Optional.ofNullable(rowList.get(6)).orElse("").toString().trim();
                }
                String salt = IdUtil.fastSimpleUUID();
                adminUser.setUsername(username);
                adminUser.setPassword(UserUtil.sign((adminUser.getUsername().trim() + password.trim()), salt));
                adminUser.setSalt(salt);
                adminUser.setNum(RandomUtil.randomNumbers(15));
                adminUser.setCreateTime(new Date());
                adminUser.setRealname(realname);
                adminUser.setMobile(username);
                adminUser.setEmail(email);
                adminUser.setPost(post);
                adminUser.setStatus(0);
                if (StrUtil.isNotEmpty(sex)) {
                    if ("女".equals(sex)) {
                        adminUser.setSex(2);
                    } else {
                        adminUser.setSex(1);
                    }
                }
                save(adminUser);
                adminUserConfigService.initUserConfig(UserUtil.getUserId());
            }else {
                if (rowIndex == 1){
                    rowList.add(0,"错误信息");
                }
                errList.add(rowIndex, rowList);
            }
        });
        FileUtil.del(filePath);
        JSONObject result = new JSONObject().fluentPut("totalSize", num.get()).fluentPut("errSize", 0);
        if (errList.size() > 2) {
            BigExcelWriter writer = null;
            try {
                String token = IdUtil.simpleUUID();
                writer = ExcelUtil.getBigWriter(FileUtil.getTmpDirPath() + "/" + token);
                // 取消数据的黑色边框以及数据左对齐
                CellStyle cellStyle = writer.getCellStyle();
                cellStyle.setFillBackgroundColor(IndexedColors.BLACK.getIndex());
                cellStyle.setBorderTop(BorderStyle.NONE);
                cellStyle.setBorderBottom(BorderStyle.NONE);
                cellStyle.setBorderLeft(BorderStyle.NONE);
                cellStyle.setBorderRight(BorderStyle.NONE);
                cellStyle.setAlignment(HorizontalAlignment.LEFT);
                Font defaultFont = writer.createFont();
                defaultFont.setFontHeightInPoints((short) 11);
                cellStyle.setFont(defaultFont);
                // 取消数字格式的数据的黑色边框以及数据左对齐
                CellStyle cellStyleForNumber = writer.getStyleSet().getCellStyleForNumber();
                cellStyleForNumber.setBorderTop(BorderStyle.NONE);
                cellStyleForNumber.setBorderBottom(BorderStyle.NONE);
                cellStyleForNumber.setBorderLeft(BorderStyle.NONE);
                cellStyleForNumber.setBorderRight(BorderStyle.NONE);
                cellStyleForNumber.setAlignment(HorizontalAlignment.LEFT);
                cellStyleForNumber.setFillBackgroundColor(IndexedColors.BLACK.getIndex());
                cellStyleForNumber.setFont(defaultFont);

                CellStyle textStyle = writer.getWorkbook().createCellStyle();
                DataFormat format = writer.getWorkbook().createDataFormat();
                textStyle.setDataFormat(format.getFormat("@"));

                writer.merge(errList.get(1).size() + 1, errList.get(0).get(0).toString().trim(), true);
                writer.getHeadCellStyle().setAlignment(HorizontalAlignment.LEFT);
                writer.getHeadCellStyle().setWrapText(true);
                Font headFont = writer.createFont();
                headFont.setFontHeightInPoints((short) 11);
                writer.getHeadCellStyle().setFont(headFont);
                writer.getHeadCellStyle().setFillPattern(FillPatternType.NO_FILL);
                writer.getOrCreateRow(0).setHeightInPoints(120);
                writer.setRowHeight(-1, 20);

                //writer.merge(6, "系统用户导入模板(*)为必填项");
                for (int i = 0; i < errList.get(1).size(); i++) {
                    writer.getSheet().setDefaultColumnStyle(i, textStyle);
                }
                errList.remove(0);
                writer.write(errList);
                result.fluentPut("errSize", errList.size() - 1).fluentPut("token", token);
            } finally {
                if (writer != null) {
                    writer.close();
                }
            }
        }
        return result;
    }

    private String getFilePath(MultipartFile file) {
        String dirPath = FileUtil.getTmpDirPath();
        try {
            InputStream inputStream = file.getInputStream();
            File fromStream = FileUtil.writeFromStream(inputStream, dirPath + "/" + IdUtil.simpleUUID() + FileUtil.getName(file.getOriginalFilename()));
            return fromStream.getAbsolutePath();
        } catch (IOException e) {
            throw new CrmException(SystemCodeEnum.SYSTEM_UPLOAD_FILE_ERROR);
        }
    }

    /**
     * 设置状态
     *
     * @param adminUserStatusBO status
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void setUserStatus(AdminUserStatusBO adminUserStatusBO) {
        for (Long id : adminUserStatusBO.getIds()) {
            if (BaseStatusEnum.CLOSE.getStatus().equals(adminUserStatusBO.getStatus())) {
                if (id.equals(UserUtil.getSuperUser())) {
                    throw new CrmException(AdminCodeEnum.ADMIN_SUPER_USER_DISABLED_ERROR);
                }
                UserUtil.userExit(id, null);
            } else if (BaseStatusEnum.OPEN.getStatus().equals(adminUserStatusBO.getStatus())) {
                Integer roleCount = adminUserRoleService.lambdaQuery().eq(AdminUserRole::getUserId, id).count();
                if (roleCount == 0) {
                    throw new CrmException(AdminCodeEnum.ADMIN_USER_NOT_ROLE_ERROR);
                }
                AdminUser adminUser = getById(id);
                if (adminUser.getDeptId() == null) {
                    throw new CrmException(AdminCodeEnum.ADMIN_USER_NOT_DEPT_ERROR);
                }
            }
            lambdaUpdate().set(AdminUser::getStatus, adminUserStatusBO.getStatus()).eq(AdminUser::getUserId, id).update();
        }
    }
    /**
     * 激活账号
     *
     * @param adminUserStatusBO status
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void activateUser(AdminUserStatusBO adminUserStatusBO) {

        for (Long id : adminUserStatusBO.getIds()) {
            if (BaseStatusEnum.CLOSE.getStatus().equals(adminUserStatusBO.getStatus())) {
                if (id.equals(UserUtil.getSuperUser())) {
                    throw new CrmException(AdminCodeEnum.ADMIN_SUPER_USER_DISABLED_ERROR);
                }
                UserUtil.userExit(id, null);
            } else if (BaseStatusEnum.OPEN.getStatus().equals(adminUserStatusBO.getStatus())) {
                Integer roleCount = adminUserRoleService.lambdaQuery().eq(AdminUserRole::getUserId, id).count();
                if (roleCount == 0) {
                    throw new CrmException(AdminCodeEnum.ADMIN_USER_NOT_ROLE_ERROR);
                }
                AdminUser adminUser = getById(id);
                if (adminUser.getDeptId() == null) {
                    throw new CrmException(AdminCodeEnum.ADMIN_USER_NOT_DEPT_ERROR);
                }

            }
            lambdaUpdate().set(AdminUser::getStatus, adminUserStatusBO.getStatus()).eq(AdminUser::getUserId, id).update();
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void resetPassword(AdminUserStatusBO adminUserStatusBO) {
        if (!ReUtil.isMatch(AdminConst.DEFAULT_PASSWORD_INTENSITY, adminUserStatusBO.getPassword())) {
            throw new CrmException(AdminCodeEnum.ADMIN_PASSWORD_INTENSITY_ERROR);
        }
        for (Long id : adminUserStatusBO.getIds()) {
            AdminUser adminUser = getById(id);
            String password = UserUtil.sign(adminUser.getUsername() + adminUserStatusBO.getPassword(), adminUser.getSalt());
            lambdaUpdate().set(AdminUser::getPassword, password).eq(AdminUser::getUserId, id).update();
            UserUtil.userExit(adminUser.getUserId(), null);
        }
    }

    /**
     * 根据用户ID查询角色ID
     *
     * @param userId userId
     * @return ids
     */
    @Override
    public List<Integer> queryUserRoleIds(Long userId) {
        QueryWrapper<AdminUserRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("role_id").eq("user_id", userId);
        return adminUserRoleService.listObjs(queryWrapper, obj -> Integer.valueOf(obj.toString()));
    }

    /**
     * 递归查询该用户下级的用户
     */
    private List<Long> queryChildUserId(List<AdminUser> userList, Long parentId, int depth) {
        depth--;
        List<Long> arrList = new ArrayList<>();
        if (depth < 0) {
            return arrList;
        }
        for (AdminUser adminUser : userList) {
            if (Objects.equals(parentId, adminUser.getParentId())) {
                arrList.add(adminUser.getUserId());
                arrList.addAll(queryChildUserId(userList, adminUser.getUserId(), depth));
            }
        }
        return arrList;
    }

    /**
     * 通讯录查询
     *
     * @param userBookBO data
     * @return
     */
    @Override
    public BasePage<UserBookVO> queryListName(UserBookBO userBookBO) {
        userBookBO.setUserId(UserUtil.getUserId());
        return getBaseMapper().queryListName(userBookBO.parse(), userBookBO);
    }

    /**
     * 切换关注状态
     *
     * @param userId 用户ID 0代表全部
     * @return
     */
    @Override
    public void attention(Long userId) {
        QueryWrapper<AdminAttention> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("be_user_id", userId);
        int count = adminAttentionService.count(queryWrapper);
        if (count > 0) {
            adminAttentionService.remove(queryWrapper);
        } else {
            AdminAttention attention = new AdminAttention();
            attention.setBeUserId(userId);
            attention.setAttentionUserId(UserUtil.getUserId());
            adminAttentionService.save(attention);
        }
    }

    /**
     * 根据ids查询用户信息
     *
     * @param ids id列表
     * @return data
     */
    @Override
    public List<SimpleUser> queryUserByIds(List<Long> ids) {
        if (ids.size() == 0) {
            return new ArrayList<>();
        }
        LambdaQueryWrapper<AdminUser> queryWrapper = new LambdaQueryWrapper<>();
        String idStr = ids.stream().map(String::valueOf).collect(Collectors.joining(Const.SEPARATOR));
        queryWrapper.select(AdminUser::getUserId, AdminUser::getImg, AdminUser::getRealname).in(AdminUser::getUserId, ids)
                .last(" ORDER BY instr('," + idStr + ",',CONCAT(',',user_id,','))");
        List<AdminUser> list = list(queryWrapper);
        return list.stream().map(obj -> BeanUtil.copyProperties(obj, SimpleUser.class)).collect(Collectors.toList());
    }

    @Override
    public List<Long> queryNormalUserByIds(List<Long> ids) {
        List<Long> userIdList = new ArrayList<>();
        if (ids.size() == 0) {
            return userIdList;
        }
        LambdaQueryWrapper<AdminUser> queryWrapper = new LambdaQueryWrapper<>();
        String idStr = ids.stream().map(String::valueOf).collect(Collectors.joining(Const.SEPARATOR));
        queryWrapper.select(AdminUser::getUserId, AdminUser::getImg, AdminUser::getRealname)
                .in(AdminUser::getUserId, ids)
                .eq(AdminUser::getStatus, 1)
                .last(" ORDER BY instr('," + idStr + ",',CONCAT(',',user_id,','))");
        List<AdminUser> list = list(queryWrapper);
        if (CollUtil.isNotEmpty(list)) {
            userIdList = list.stream().map(AdminUser::getUserId).collect(Collectors.toList());
        }
        return userIdList;
    }

    /**
     * 根据部门ids查询用户列表
     * 2024年10月9日 liujiaming修改了查找算法,先查找子部门再往下面查找
     * @param ids id列表
     * @return data
     */
    @Override
    public List<Long> queryUserByDeptIds(List<Integer> ids) {
        if (ids.size() == 0) {
            return new ArrayList<>();
        }
    List<Integer> newIds=    new ArrayList<>();
       // 先查询子部门列表
        for (Integer id : ids) {
            newIds.addAll(iAdminDeptService.queryChildDept(id) );
        }
        newIds.addAll(ids);
        LambdaQueryWrapper<AdminUser> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.select(AdminUser::getUserId);
        if (newIds.size() > 1) {
            queryWrapper.in(AdminUser::getDeptId, newIds);
        } else {
            queryWrapper.eq(AdminUser::getDeptId, newIds.get(0));
        }
        return listObjs(queryWrapper, obj -> Long.valueOf(obj.toString()));
    }

    @Autowired
    private HrmService hrmService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void hrmAddUser(HrmAddUserBO hrmAddUserBO) {
        Result<Set<HrmEmployee>> listResult = hrmService.queryEmployeeListByIds(hrmAddUserBO.getEmployeeIds());
        Set<HrmEmployee> employeeList = listResult.getData();
        for (HrmEmployee hrmEmployee : employeeList) {
            AdminUserVO adminUserVO = new AdminUserVO();
            adminUserVO.setRealname(hrmEmployee.getEmployeeName());
            adminUserVO.setUsername(hrmEmployee.getMobile());
            adminUserVO.setSex(hrmEmployee.getSex());
            adminUserVO.setMobile(hrmEmployee.getMobile());
            adminUserVO.setPassword(hrmAddUserBO.getPassword());
            adminUserVO.setEmail(hrmEmployee.getEmail());
            adminUserVO.setDeptId(hrmAddUserBO.getDeptId());
            adminUserVO.setParentId(hrmAddUserBO.getParentId());
            adminUserVO.setRoleId(hrmAddUserBO.getRoleId());
            adminUserVO.setPost(hrmEmployee.getPost());
            addUser(adminUserVO);
        }
    }

    @Override
    public DeptUserListVO queryDeptUserList(Integer deptId, boolean isAllUser) {
        DeptUserListVO deptUserListVO = new DeptUserListVO();
        List<DeptVO> deptList = adminDeptService.queryDeptUserList();
        createTree(deptId, deptList);
        List<HrmSimpleUserVO> userList;
        if (isAllUser) {
            userList = getBaseMapper().querySimpleUserByDeptId(deptId);
        } else {
            userList = getBaseMapper().querySimpleUserByDeptIdAndExamine(deptId);
        }
        List<DeptVO> collect = deptList.stream().filter(dept -> dept.getPid().equals(deptId)).collect(Collectors.toList());
        deptUserListVO.setDeptList(collect);
        deptUserListVO.setUserList(userList);
        return deptUserListVO;
    }

    private List<DeptVO> createTree(int pid, List<DeptVO> deptList) {
        List<DeptVO> treeDept = new ArrayList<>();
        for (DeptVO dept : deptList) {
            if (pid == dept.getPid()) {
                treeDept.add(dept);
                List<DeptVO> children = createTree(dept.getDeptId(), deptList);
                if (CollUtil.isNotEmpty(children)) {
                    for (DeptVO child : children) {
                        dept.setAllNum(dept.getAllNum() + child.getAllNum());
                    }
                    dept.setHasChildren(1);
                } else {
                    dept.setHasChildren(0);
                }
            }
        }
        return treeDept;
    }

    @Override
    public Set<HrmSimpleUserVO> queryDeptUserListByHrm(DeptUserListByHrmBO deptUserListByHrmBO) {
        Set<HrmSimpleUserVO> userVOSet = new HashSet<>();
        if (CollUtil.isNotEmpty(deptUserListByHrmBO.getDeptIdList())) {
            List<AdminUser> userList = findChildUserList(deptUserListByHrmBO.getDeptIdList());
            List<HrmSimpleUserVO> hrmSimpleUserVOS = TransferUtil.transferList(userList, HrmSimpleUserVO.class);
            userVOSet.addAll(hrmSimpleUserVOS);
        }
        if (CollUtil.isNotEmpty(deptUserListByHrmBO.getUserIdList())) {
            List<AdminUser> userList = query().select("user_id", "realname", "img", "sex", "username as mobile", "post").in("user_id", deptUserListByHrmBO.getUserIdList())
                    .ne("status", 0).list();
            List<HrmSimpleUserVO> hrmSimpleUserVOS = TransferUtil.transferList(userList, HrmSimpleUserVO.class);
            userVOSet.addAll(hrmSimpleUserVOS);
        }
        return userVOSet;
    }

    private List<AdminUser> findChildUserList(List<Integer> deptIds) {
        List<AdminUser> empList = new ArrayList<>();
        for (Integer deptId : deptIds) {
            List<AdminUser> list = query().select("user_id", "realname", "img", "sex", "username as mobile", "post").eq("dept_id", deptId).ne("status", 0).list();
            empList.addAll(list);
            List<AdminDept> childList = adminDeptService.lambdaQuery().select(AdminDept::getDeptId).eq(AdminDept::getPid, deptId).list();
            if (CollUtil.isNotEmpty(childList)) {
                List<Integer> childDeptIds = childList.stream().map(AdminDept::getDeptId).collect(Collectors.toList());
                empList.addAll(findChildUserList(childDeptIds));
            }
        }
        return empList;
    }

    @Override
    public List<Long> queryUserIdByRealName(List<String> realNames) {
        if (CollUtil.isEmpty(realNames)) {
            return new ArrayList<>();
        }
        return lambdaQuery().select(AdminUser::getUserId)
                .in(AdminUser::getRealname, realNames)
                .list().stream().map(AdminUser::getUserId).collect(Collectors.toList());
    }

    @Override
    public UserInfo queryLoginUserInfo(Long userId) {
        UserInfo userInfo = getBaseMapper().queryLoginUserInfo(userId);
        userInfo.setSuperUserId(UserUtil.getSuperUser());
        AdminRole role = adminRoleService.lambdaQuery().eq(AdminRole::getRemark, "admin").last(" limit 1").one();
        userInfo.setSuperRoleId(role.getRoleId());
        userInfo.setRoles(queryUserRoleIds(userInfo.getUserId()));
        return userInfo;
    }

    /**
     * 查询当前系统有没有初始化
     *据数据库中的记录数量判断系统状态
     * @return data
     */
    @Override
    public Integer querySystemStatus() {
        Integer count = lambdaQuery().count();
        return count > 0 ? 1 : 0;
    }

    /**
     * 系统用户初始化
     */
    @Override
    public void initUser(SystemUserBO systemUserBO) {
        Integer integer = querySystemStatus();
        if (integer > 0) {
            return;
        }
        JSONObject jsonObject = null;
        AdminUser adminUser = new AdminUser();
        adminUser.setUsername(systemUserBO.getUsername());
        adminUser.setSalt(IdUtil.simpleUUID());
        adminUser.setPassword(UserUtil.sign(systemUserBO.getUsername() + systemUserBO.getPassword(), adminUser.getSalt()));
        adminUser.setCreateTime(new Date());
        adminUser.setRealname("admin");
        adminUser.setMobile(systemUserBO.getUsername());
        adminUser.setDeptId(14852);
        adminUser.setPost("标准岗位");
        adminUser.setStatus(1);
        adminUser.setParentId(0L);
        save(adminUser);
        lambdaUpdate().set(AdminUser::getUserId, UserUtil.getSuperUser())
                .eq(AdminUser::getUserId, adminUser.getUserId()).update();
        adminUserConfigService.save(new AdminUserConfig(null, UserUtil.getSuperUser(), 1, "InitUserConfig", jsonObject.toJSONString(), "用户信息"));
        registerSeataToNacos();
    }

    @Value("${seata.config.nacos.serverAddr}")
    private String serverAddr;

    @Autowired
    private DataSourceProperties dataSourceProperties;

    private void registerSeataToNacos() {
        Map<String, String> nacosMap = new HashMap<>();
        nacosMap.put("service.vgroupMapping.crm_tx_group", "default");
        nacosMap.put("service.vgroupMapping.admin_tx_group", "default");
        nacosMap.put("service.vgroupMapping.examine_tx_group", "default");
        nacosMap.put("service.vgroupMapping.oa_tx_group", "default");
        nacosMap.put("service.vgroupMapping.hrm_tx_group", "default");
        nacosMap.put("service.vgroupMapping.jxc_tx_group", "default");
        nacosMap.put("store.mode", "db");
        nacosMap.put("store.db.datasource", "druid");
        nacosMap.put("store.db.dbType", "mysql");
        nacosMap.put("store.db.driverClassName", "com.mysql.jdbc.Driver");
        String host = dataSourceProperties.getUrl().replace("jdbc:mysql://", "").split(":")[0];
        nacosMap.put("store.db.url", "jdbc:mysql://" + host + ":3306/seata?useUnicode=true");
        nacosMap.put("store.db.user", dataSourceProperties.getUsername());
        nacosMap.put("store.db.password", dataSourceProperties.getPassword());
        nacosMap.put("store.db.minConn", "5");
        nacosMap.put("store.db.maxConn", "30");
        nacosMap.put("store.db.globalTable", "global_table");
        nacosMap.put("store.db.branchTable", "branch_table");
        nacosMap.put("store.db.queryLimit", "100");
        nacosMap.put("store.db.lockTable", "lock_table");
        nacosMap.put("store.db.maxWait", "5000");
        String group = "SEATA_GROUP";
        nacosMap.forEach((k, v) -> {
            try {
                Properties properties = new Properties();
                properties.put("serverAddr", serverAddr);
                ConfigService configService = NacosFactory.createConfigService(properties);
                boolean isPublishOk = configService.publishConfig(k, group, v);
                log.warn("seata初始化：{}", isPublishOk);
            } catch (NacosException e) {
                log.error("同步seata失败", e);
            }
        });

    }

    /**
     * 查询所有员工
     *
     * @return
     */
    @Override
    public List<UserInfo> queryAllUserInfoList() {
        List<AdminUser> adminUserList = lambdaQuery().list();
        List<AdminUserRole> userRoles = adminUserRoleService.query().list();
        Map<Long, List<AdminUserRole>> longListMap = userRoles.stream().collect(Collectors.groupingBy(AdminUserRole::getUserId));
        List<UserInfo> userInfoList = adminUserList.stream().map(user -> BeanUtil.copyProperties(user, UserInfo.class)).collect(Collectors.toList());
        for (UserInfo userInfo : userInfoList) {
            List<AdminUserRole> roleList = longListMap.get(userInfo.getUserId());
            if (roleList == null) {
                roleList = new ArrayList<>();
            }
            userInfo.setRoles(roleList.stream().map(AdminUserRole::getRoleId).collect(Collectors.toList()));
        }
        return userInfoList;
    }

    @Override
    public void downloadExcel(HttpServletResponse response) throws IOException {
        List<JSONObject> list = queryField();
        ExcelParseUtil.importExcel(new ExcelParseUtil.ExcelParseService() {
            @Override
            public void castData(Map<String, Object> record, Map<String, Integer> headMap) {

            }
            @Override
            public String getExcelName() {
                return "员工";
            }
        }, list, response,"user");
    }

    @Override
    public List<Long> queryAllUserList(Integer type) {
        LambdaQueryWrapper<AdminUser> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.select(AdminUser::getUserId);
        /* type=2代表不查询禁用员工 */
        if (Objects.equals(2,type)) {
            queryWrapper.ne(AdminUser::getStatus,0);
        }
        return this.listObjs(queryWrapper, TypeUtils::castToLong);
    }

    /**
     * 查询当前登录用户的基本信息
     * @param request
     * @param response
     * @return
     */
    @Override
    public AdminUserVO queryLoginUser(HttpServletRequest request, HttpServletResponse response) {
        String name = "readNotice";
        AdminUser user =this.getById(UserUtil.getUserId());
        if (user == null) {
            throw new NoLoginException();
        }
        AdminSuperUserVo adminUser = BeanUtil.copyProperties(user, AdminSuperUserVo.class);
        adminUser.setIsAdmin(UserUtil.isAdmin());
        AdminUserConfig userConfig = adminUserConfigService.queryUserConfigByName(name);
        adminUser.setIsReadNotice(userConfig != null ? userConfig.getStatus() : 0);
        adminUser.setPassword(null);
        String deptName = deptService.getNameByDeptId(adminUser.getDeptId());
        adminUser.setDeptName(deptName);
        adminUser.setParentName(UserCacheUtil.getUserName(adminUser.getParentId()));
        AdminConfig config = ApplicationContextHolder.getBean(IAdminConfigService.class).queryConfigByName("email");
        if (config != null && config.getStatus() == 1) {
            Integer data = ApplicationContextHolder.getBean(EmailService.class).getEmailId(adminUser.getUserId()).getData();
            adminUser.setEmailId(data);
        }
        AdminUserConfig userConfigByName = adminUserConfigService.queryUserConfigByName("InitUserConfig");
        if(userConfigByName != null){
            adminUser.setServerUserInfo(JSON.parseObject(userConfigByName.getValue()));
        }
        return adminUser;
    }

    private List<JSONObject> queryField(){
        List<JSONObject> list = new ArrayList<>();
        list.add(queryField("username", FieldEnum.TEXT.getFormType(),FieldEnum.TEXT.getType(),"手机号",1));
        list.add(queryField("password",FieldEnum.TEXT.getFormType(),FieldEnum.TEXT.getType(),"登录密码",1));
        list.add(queryField("realname",FieldEnum.TEXT.getFormType(),FieldEnum.TEXT.getType(),"姓名",1));
        list.add(queryField("sex",FieldEnum.TEXT.getFormType(),FieldEnum.TEXT.getType(),"性别",0));
        list.add(queryField("email",FieldEnum.TEXT.getFormType(),FieldEnum.TEXT.getType(),"邮箱",0));
        list.add(queryField("deptName",FieldEnum.TEXT.getFormType(),FieldEnum.TEXT.getType(),"部门",1));
        list.add(queryField("post",FieldEnum.TEXT.getFormType(),FieldEnum.TEXT.getType(),"岗位",0));
        return list;
    }
     private JSONObject queryField(String fieldName, String formType, Integer type ,String name,Integer isNull){
         JSONObject json = new JSONObject();
         json.fluentPut("fieldName",fieldName)
                 .fluentPut("formType", formType)
                 .fluentPut("type", type)
                 .fluentPut("name",name).fluentPut("isNull",isNull);
         return json;
     }
}
