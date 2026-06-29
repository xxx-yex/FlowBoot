package com.flowboot.controller;

import com.flowboot.common.R;
import com.flowboot.framework.security.JwtUtils;
import com.flowboot.framework.security.SecurityUtils;
import com.flowboot.system.entity.SysMenu;
import com.flowboot.system.entity.SysUser;
import com.flowboot.system.service.SysLogininforService;
import com.flowboot.system.service.SysMenuService;
import com.flowboot.system.service.SysUserService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class SysLoginController {

    private final SysUserService sysUserService;
    private final SysMenuService sysMenuService;
    private final SysLogininforService sysLogininforService;
    private final PasswordEncoder passwordEncoder;

    @PostMapping("/login")
    public R<Map<String, Object>> login(@RequestBody Map<String, String> body, HttpServletRequest request) {
        String username = body.get("username");
        String password = body.get("password");
        try {
            String token = sysUserService.login(username, password);
            sysLogininforService.recordLogin(username, 0, "登录成功", request.getRemoteAddr());
            Map<String, Object> result = new HashMap<>();
            result.put("token", token);
            return R.ok(result);
        } catch (Exception e) {
            sysLogininforService.recordLogin(username, 1, e.getMessage(), request.getRemoteAddr());
            throw e;
        }
    }

    @GetMapping("/getInfo")
    public R<Map<String, Object>> getInfo() {
        String username = SecurityUtils.getUsername();
        SysUser user = sysUserService.findByUsername(username);
        Map<String, Object> result = new HashMap<>();
        result.put("user", user);
        return R.ok(result);
    }

    @GetMapping("/getRouters")
    public R<List<SysMenu>> getRouters() {
        String username = SecurityUtils.getUsername();
        SysUser user = sysUserService.findByUsername(username);
        List<SysMenu> menus = sysMenuService.selectMenusByUserId(user.getId());
        List<SysMenu> tree = sysMenuService.buildMenuTree(menus, 0L);
        return R.ok(tree);
    }
}
