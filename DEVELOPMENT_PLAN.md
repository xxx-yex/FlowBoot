# Phase 1: FlowBoot 项目骨架与 Maven 多模块

## 目标
在 E:\interview\FlowBoot 下搭建完整的 Maven 多模块项目骨架，确保 `mvn validate` 通过

## 模块结构

```
FlowBoot/
├── pom.xml                    # 父 POM（Spring Boot 3.5.4 parent）
├── flowboot-common/           # 通用工具
│   └── pom.xml
├── flowboot-framework/        # 框架核心
│   └── pom.xml
├── flowboot-system/           # 系统管理
│   └── pom.xml
├── flowboot-admin/            # 后台管理入口（Spring Boot Application）
│   └── pom.xml
├── flowboot-workflow/         # 工作流引擎
│   └── pom.xml
├── .gitignore
├── LICENSE
└── README.md
```

## 依赖关系

```
flowboot-admin
  ├── flowboot-framework
  ├── flowboot-system
  └── flowboot-workflow

flowboot-framework
  └── flowboot-common

flowboot-system
  └── flowboot-common

flowboot-workflow
  └── flowboot-common
```

## 各模块职责

| 模块 | groupId | artifactId | 职责 |
|------|---------|-----------|------|
| flowboot-common | com.flowboot | flowboot-common | 工具类、常量、注解、异常定义、基础实体 |
| flowboot-framework | com.flowboot | flowboot-framework | Security配置、数据源配置、AOP、拦截器 |
| flowboot-system | com.flowboot | flowboot-system | 用户/角色/菜单/部门/字典/日志 Service+Mapper |
| flowboot-admin | com.flowboot | flowboot-admin | 启动入口、Controller 层、application.yml |
| flowboot-workflow | com.flowboot | flowboot-workflow | DAG引擎、NodeExecutor、SSE、LLM集成 |

## 父 POM 关键配置

- parent: spring-boot-starter-parent 3.5.4
- java.version: 21
- 统一依赖版本管理（dependencyManagement）
- 核心依赖：
  - mybatis-plus-spring-boot3-starter 3.5.7
  - redisson-spring-boot-starter 3.30.0
  - spring-boot-starter-security
  - mysql-connector-j
  - lombok 1.18.32
  - hutool-core 5.8.27
  - fastjson2 2.0.51
  - minio 8.5.7
  - spring-ai-starter-model-openai 1.1.2

## 产出文件清单

1. FlowBoot/pom.xml
2. FlowBoot/flowboot-common/pom.xml
3. FlowBoot/flowboot-framework/pom.xml
4. FlowBoot/flowboot-system/pom.xml
5. FlowBoot/flowboot-admin/pom.xml
6. FlowBoot/flowboot-workflow/pom.xml
7. FlowBoot/.gitignore
8. FlowBoot/LICENSE
9. FlowBoot/README.md

## 验证方式

- 所有 pom.xml 依赖关系正确，无版本冲突
- `mvn validate` 通过（本地有 Maven 的前提下）
- 模块依赖关系符合设计

## 不做的事情（本阶段）

- 不写 Java 代码
- 不写 SQL
- 不写前端
- 不配 Docker
