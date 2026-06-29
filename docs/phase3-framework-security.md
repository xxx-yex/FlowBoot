# Phase 3: 框架核心 - Security + JWT + 数据源 + AOP

## 目标

让登录接口跑通：用户名密码 → JWT Token → 受保护接口鉴权

## 产出文件

### flowboot-framework 模块

1. SecurityConfig.java — Spring Security 配置，放行登录接口
2. JwtUtils.java — JWT 生成/解析/验证工具类
3. JwtAuthenticationFilter.java — JWT 过滤器，从 Header 取 token 鉴权
4. JwtAuthenticationEntryPoint.java — 未登录返回 401
5. CustomAccessDeniedHandler.java — 无权限返回 403
6. SecurityUtils.java — 获取当前登录用户信息
7. MybatisPlusConfig.java — MyBatis-Plus 分页插件 + 自动填充
8. CorsConfig.java — 跨域配置

### flowboot-common 模块

9. R.java — 统一响应封装
10. ServiceException.java — 业务异常
11. GlobalExceptionHandler.java — 全局异常处理

### flowboot-system 模块

12. SysUserService.java / SysUserServiceImpl.java — 用户登录验证 + 查询
13. SysMenuService.java / SysMenuServiceImpl.java — 根据用户查菜单权限
14. SysLogininforService.java / SysLogininforServiceImpl.java — 记录登录日志

### flowboot-admin 模块

15. SysLoginController.java — 登录接口 /logout
16. SysUserController.java — 获取当前用户信息 /getInfo
17. SysMenuController.java — 获取当前用户菜单 /getRouters

## 登录流程

```
1. POST /login { username, password }
2. SysUserService 验证密码（BCrypt）
3. 生成 JWT Token 返回给前端
4. 记录登录日志 sys_logininfor

后续请求：
1. 前端 Header 携带 Authorization: Bearer <token>
2. JwtAuthenticationFilter 解析 token
3. 从数据库加载用户权限列表
4. 放入 SecurityContext
5. Controller 通过 @PreAuthorize 校验权限
```

## 验证方式

- POST /login 能返回 token
- GET /getInfo 能返回当前用户信息
- GET /getRouters 能返回当前用户菜单树
- 未登录访问受保护接口返回 401

## 本阶段不做

- 不写前端页面
- 不配 Docker
