# Phase 1: 项目骨架与 Maven 多模块

## 目标

在 FlowBoot/ 下搭建完整的 Maven 多模块项目骨架，确保模块依赖关系正确

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
├── flowboot-admin/            # 启动入口
│   ├── pom.xml
│   └── src/main/java/com/flowboot/FlowBootApplication.java
│   └── src/main/resources/application.yml
├── flowboot-workflow/         # 工作流引擎
│   └── pom.xml
```

## 依赖关系

```
flowboot-admin
  ├── flowboot-framework
  ├── flowboot-system
  └── flowboot-workflow

flowboot-framework → flowboot-common
flowboot-system    → flowboot-common
flowboot-workflow  → flowboot-common
```

## 父 POM 关键配置

- parent: spring-boot-starter-parent 3.5.4
- java.version: 21
- groupId: com.flowboot
- 统一依赖版本管理（dependencyManagement）：
  - mybatis-plus-spring-boot3-starter 3.5.7
  - redisson-spring-boot-starter 3.30.0
  - mysql-connector-j
  - lombok 1.18.32
  - hutool-core 5.8.27
  - fastjson2 2.0.51
  - minio 8.5.7
  - spring-ai-starter-model-openai 1.1.2（BOM）
  - springdoc-openapi-starter-webmvc-ui

## 产出文件清单

1. pom.xml（父 POM）
2. flowboot-common/pom.xml
3. flowboot-framework/pom.xml
4. flowboot-system/pom.xml
5. flowboot-admin/pom.xml
6. flowboot-admin/src/main/java/com/flowboot/FlowBootApplication.java
7. flowboot-admin/src/main/resources/application.yml
8. flowboot-workflow/pom.xml

## 验证方式

- 所有 pom.xml 依赖关系正确，无版本冲突
- FlowBootApplication.java 能正常启动（连不上数据库无妨，只要不报依赖错误）

## 本阶段不做

- 不写业务 Java 代码（除 Application 启动类）
- 不写 SQL
- 不写前端
- 不配 Docker
