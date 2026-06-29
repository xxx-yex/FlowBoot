package com.flowboot.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.flowboot.system.entity.SysMenu;

import java.util.List;

public interface SysMenuService extends IService<SysMenu> {

    List<SysMenu> selectMenusByUserId(Long userId);

    List<SysMenu> buildMenuTree(List<SysMenu> menus, Long parentId);
}
