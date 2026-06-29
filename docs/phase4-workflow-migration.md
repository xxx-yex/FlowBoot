# Phase 4: 工作流引擎迁移

## 目标

将 StreamFlow 的 core-workflow-java 迁移到 flowboot-workflow 模块，包名从 com.iflytek.astron 改为 com.flowboot.workflow

## 迁移策略

批量复制 + 包名替换，保持原有代码逻辑不变

## 包名映射

| 原包名 | 新包名 |
|--------|--------|
| com.iflytek.astron.workflow | com.flowboot.workflow |
| com.iflytek.astron.link | com.flowboot.workflow.link |

## 迁移文件清单（按层次）

### 引擎核心（最核心，必须迁移）
- engine/ParallelWorkflowEngine.java
- engine/VariablePool.java
- engine/WorkflowEngine.java
- engine/WorkflowEngineNodeDebug.java
- engine/constants/（7 个枚举）
- engine/context/EngineContextHolder.java
- engine/domain/（全部：chain/ + callbacks/）
- engine/node/（接口 + 抽象类 + 4 个实现）
- engine/util/（4 个工具类）
- exception/（2 个异常类）

### 工作流持久层
- flow/config/WorkflowDataSourceConfig.java
- flow/entity/WorkflowEntity.java
- flow/mapper/WorkflowMapper.java
- flow/service/WorkflowService.java

### Link 插件（工具执行）
- link/（全部 16 个文件）

### Controller
- controller/（4 个 Controller + 5 个 VO）

### 集成层
- integration/model/（LLM 集成）
- integration/plugins/（插件/TTS 集成）

### 配置
- components/（工具类）

## 产出

1. flowboot-workflow/src/main/java/com/flowboot/workflow/ 下所有迁移后的 Java 文件
2. flowboot-workflow/src/main/resources/application.yml（工作流专用配置）
3. flowboot-workflow/src/main/resources/mapper/（XML Mapper 文件）

## 验证方式

- 包名替换后无编译错误
- 所有 import 语句正确指向 com.flowboot.workflow

## 本阶段不做

- 不改逻辑
- 不改数据库表（沿用 StreamFlow 的 workflow/link 表结构）
- 不写前端
