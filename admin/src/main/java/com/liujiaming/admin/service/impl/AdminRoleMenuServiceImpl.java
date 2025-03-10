package com.liujiaming.admin.service.impl;

import com.liujiaming.admin.entity.PO.AdminRoleMenu;
import com.liujiaming.admin.mapper.AdminRoleMenuMapper;
import com.liujiaming.admin.service.IAdminRoleMenuService;
import com.liujiaming.core.common.Const;
import com.liujiaming.core.servlet.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 角色菜单对应关系表 服务实现类
 * </p>
 *
 * @author liujiaming
 * @since 2024-04-27
 */
@Service
public class AdminRoleMenuServiceImpl extends BaseServiceImpl<AdminRoleMenuMapper, AdminRoleMenu> implements IAdminRoleMenuService {

    @Override
    public void saveRoleMenu(Integer roleId, List<Integer> menuIdList) {
        List<AdminRoleMenu> adminRoleMenuList = new ArrayList<>();
        menuIdList.forEach(menuId -> {
            AdminRoleMenu adminRoleMenu = new AdminRoleMenu();
            adminRoleMenu.setMenuId(menuId);
            adminRoleMenu.setRoleId(roleId);
            adminRoleMenuList.add(adminRoleMenu);
        });
        saveBatch(adminRoleMenuList, Const.BATCH_SAVE_SIZE);
    }
}
