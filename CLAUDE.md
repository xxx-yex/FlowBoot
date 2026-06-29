# FlowBoot - 基于 AI Agent 工作流编排的快速开发框架

## 项目定位

FlowBoot 融合了 StreamFlow（AI Agent 工作流编排）和 若依 RuoYi（RBAC 后台管理），提供开箱即用的 AI Agent 应用快速开发能力。

### 两层权限模型

- 系统权限（RBAC）：角色 → 菜单 → 按钮，决定能看到哪些页面
- 业务权限（空间）：用户 → 空间 → 权限，决定能操作哪个空间里的 Agent/工作流

## 技术栈

| 层 | 技术 | 版本 |
|----|------|------|
| 语言 | Java | 21 |
| 框架 | Spring Boot | 3.5.4 |
| ORM | MyBatis-Plus | 3.5.7 |
| 认证 | Spring Security + JWT | - |
| 缓存 | Redisson | 3.30.0 |
| 前端 | React + TypeScript + Vite + Ant Design | - |
| 工作流 | ReactFlow + 自研 DAG 引擎 | - |
| 数据库 | MySQL | 8.4 |
| 对象存储 | MinIO | - |
| AI 集成 | Spring AI + OpenAI SDK | 1.1.2 |

## 项目结构

```
FlowBoot/
├── flowboot-common/         # 通用工具：注解、常量、异常、基础实体
├── flowboot-framework/      # 框架核心：Security、数据源、AOP、拦截器
├── flowboot-system/         # 系统管理：用户/角色/菜单/部门/字典/日志
├── flowboot-admin/          # 启动入口：Application + Controller + 配置
├── flowboot-workflow/       # 工作流引擎：DAG、NodeExecutor、SSE、LLM
├── flowboot-console/        # 控制台（后续阶段）
├── docker/                  # Docker 部署
├── scripts/                 # 运维脚本
└── docs/                    # 项目文档
```

## 模块依赖关系

```
flowboot-admin (启动入口)
  ├── flowboot-framework (框架核心)
  ├── flowboot-system    (系统管理)
  └── flowboot-workflow  (工作流引擎)

flowboot-framework → flowboot-common
flowboot-system    → flowboot-common
flowboot-workflow  → flowboot-common
```

## 开发节奏

每完成一个最小闭环必须推送到远程仓库，保证 Git 历史可追溯：

1. 每次开发前，先写好对应阶段的开发计划
2. 按计划执行，完成一个最小闭环后立即 commit + push
3. commit 格式遵循下方 Git 提交规范

最小闭环定义：一个可独立验证的功能单元，比如"项目骨架搭建完成"、"sys_user 表+CRUD 完成"、"登录接口跑通"等。

## Git 提交格式

```
[标签] 简短描述：详细说明
```

标签说明：
- [骨架] 项目骨架、配置文件
- [功能] 新功能
- [修复] Bug 修复
- [重构] 代码重构
- [文档] 文档变更
- [部署] Docker/CI/部署相关
- [工具] 脚本、工具
- [测试] 测试相关

## Java 编码规范

- 包名：com.flowboot.*（统一前缀）
- Lombok：必须使用 @Data、@Slf4j、@Builder
- 注释：不添加注释，除非逻辑特别复杂
- 异常：使用 ServiceException，禁止裸抛 RuntimeException
- 日志：@Slf4j + log.info/warn/error，禁止 System.out.println
- 命名：类名 PascalCase，方法/变量 camelCase，常量 UPPER_SNAKE_CASE
- 分层：Controller → Service → Mapper，禁止跨层调用
- 权限注解：@PreAuthorize("@ss.hasPermi('system:user:list')")

## 数据库规范

- 表名：sys_ 前缀为系统表，biz_ 前缀为业务表
- 主键：bigint 自增，字段名统一 id
- 公共字段：create_by, create_time, update_by, update_time, remark
- 逻辑删除：del_flag char(1)，0=存在 2=删除
- 状态字段：status char(1)，0=正常 1=停用
- 字符集：utf8mb4 + utf8mb4_unicode_ci

## 前端规范

- 组件：React 函数组件 + Hooks
- 状态管理：Zustand（全局）/ React useState（局部）
- 路由：React Router v6，懒加载
- API：集中管理在 src/services/
- 样式：Tailwind CSS + Ant Design
- 国际化：react-i18next

## 禁止事项

- 禁止硬编码服务地址，必须用环境变量
- 禁止提交 .env 文件（含密钥）
- 禁止跨模块直接依赖（必须通过 common 传递）
- 禁止在 Controller 写业务逻辑
- 禁止使用 System.out.println

## 开发阶段

| 阶段 | 内容 | 状态 |
|------|------|------|
| 1 | 项目骨架与 Maven 多模块 | 进行中 |
| 2 | 系统管理模块（sys_user/role/menu/dept/dict/log） | 待开始 |
| 3 | 框架核心（Security + JWT + 数据源 + AOP） | 待开始 |
| 4 | 工作流引擎迁移 | 待开始 |
| 5 | 控制台后端（Hub API） | 待开始 |
| 6 | 控制台前端（React + 动态菜单） | 待开始 |
| 7 | Docker 部署 | 待开始 |
| 8 | 联调与验证 | 待开始 |
