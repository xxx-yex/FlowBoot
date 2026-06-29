package com.flowboot.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.flowboot.system.entity.SysUser;

public interface SysUserService extends IService<SysUser> {

    SysUser findByUsername(String username);

    String login(String username, String password);
}
