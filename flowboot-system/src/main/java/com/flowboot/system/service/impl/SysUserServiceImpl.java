package com.flowboot.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.flowboot.common.exception.ServiceException;
import com.flowboot.framework.security.JwtUtils;
import com.flowboot.system.entity.SysUser;
import com.flowboot.system.mapper.SysUserMapper;
import com.flowboot.system.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    private final JwtUtils jwtUtils;
    private final PasswordEncoder passwordEncoder;

    @Override
    public SysUser findByUsername(String username) {
        return getOne(new LambdaQueryWrapper<SysUser>().eq(SysUser::getUsername, username));
    }

    @Override
    public String login(String username, String password) {
        SysUser user = findByUsername(username);
        if (user == null) {
            throw new ServiceException("用户不存在");
        }
        if ("1".equals(user.getStatus())) {
            throw new ServiceException("用户已停用");
        }
        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new ServiceException("密码错误");
        }
        Map<String, Object> claims = new HashMap<>();
        claims.put("nickname", user.getNickname());
        return jwtUtils.generateToken(user.getId(), user.getUsername(), claims);
    }
}
