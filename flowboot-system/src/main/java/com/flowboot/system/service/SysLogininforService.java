package com.flowboot.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.flowboot.system.entity.SysLogininfor;

public interface SysLogininforService extends IService<SysLogininfor> {

    void recordLogin(String username, int status, String msg, String ip);
}
