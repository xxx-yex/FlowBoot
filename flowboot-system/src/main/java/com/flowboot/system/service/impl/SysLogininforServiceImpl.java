package com.flowboot.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.flowboot.system.entity.SysLogininfor;
import com.flowboot.system.mapper.SysLogininforMapper;
import com.flowboot.system.service.SysLogininforService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class SysLogininforServiceImpl extends ServiceImpl<SysLogininforMapper, SysLogininfor> implements SysLogininforService {

    @Override
    public void recordLogin(String username, int status, String msg, String ip) {
        SysLogininfor info = new SysLogininfor();
        info.setUsername(username);
        info.setStatus(status);
        info.setMsg(msg);
        info.setIpaddr(ip);
        info.setLoginTime(LocalDateTime.now());
        save(info);
    }
}
