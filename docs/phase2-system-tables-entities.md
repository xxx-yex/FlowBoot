# Phase 2: 系统管理模块 - 数据库表设计 + 实体类

## 目标

创建 RBAC 系统管理所需的 6 张核心表及对应实体类

## 数据库表设计

### 表清单

| 表名 | 说明 | 来源 |
|------|------|------|
| sys_user | 用户表 | 若依 + StreamFlow 字段合并 |
| sys_role | 角色表 | 若依 |
| sys_menu | 菜单表 | 若依 |
| sys_dept | 部门表 | 若依 |
| sys_dict_type | 字典类型表 | 若依 |
| sys_dict_data | 字典数据表 | 若依 |
| sys_user_role | 用户角色关联表 | 若依 |
| sys_role_menu | 角色菜单关联表 | 若依 |
| sys_oper_log | 操作日志表 | 若依 |
| sys_logininfor | 登录日志表 | 若依 |

### 字段设计原则

- 主键：bigint 自增，字段名 id
- 公共字段：create_by, create_time, update_by, update_time, remark
- 逻辑删除：del_flag char(1)，0=存在 2=删除
- 状态字段：status char(1)，0=正常 1=停用
- 字符集：utf8mb4 + utf8mb4_unicode_ci

## sys_user 字段（合并若依 + StreamFlow）

| 字段 | 类型 | 说明 |
|------|------|------|
| id | bigint | 主键 |
| dept_id | bigint | 部门ID |
| username | varchar(30) | 登录账号 |
| nickname | varchar(30) | 用户昵称 |
| email | varchar(50) | 邮箱 |
| phone | varchar(11) | 手机号 |
| sex | char(1) | 性别 0男 1女 2未知 |
| avatar | varchar(200) | 头像地址 |
| password | varchar(100) | 密码（BCrypt加密） |
| status | char(1) | 状态 0正常 1停用 |
| del_flag | char(1) | 删除标志 0存在 2删除 |
| login_ip | varchar(128) | 最后登录IP |
| login_date | datetime | 最后登录时间 |
| create_by | varchar(64) | 创建者 |
| create_time | datetime | 创建时间 |
| update_by | varchar(64) | 更新者 |
| update_time | datetime | 更新时间 |
| remark | varchar(500) | 备注 |

## sys_role 字段

| 字段 | 类型 | 说明 |
|------|------|------|
| id | bigint | 主键 |
| role_name | varchar(30) | 角色名称 |
| role_key | varchar(100) | 角色权限字符串 |
| sort | int | 显示顺序 |
| data_scope | char(1) | 数据范围 1=全部 2=自定义 3=本部门 4=本部门及以下 5=仅本人 |
| status | char(1) | 状态 |
| del_flag | char(1) | 删除标志 |
| create_by | varchar(64) | 创建者 |
| create_time | datetime | 创建时间 |
| update_by | varchar(64) | 更新者 |
| update_time | datetime | 更新时间 |
| remark | varchar(500) | 备注 |

## sys_menu 字段

| 字段 | 类型 | 说明 |
|------|------|------|
| id | bigint | 主键 |
| parent_id | bigint | 父菜单ID |
| menu_name | varchar(50) | 菜单名称 |
| menu_type | char(1) | 类型 M=目录 C=菜单 F=按钮 |
| path | varchar(200) | 路由地址 |
| component | varchar(200) | 组件路径 |
| perm | varchar(100) | 权限标识 |
| icon | varchar(100) | 菜单图标 |
| sort | int | 显示顺序 |
| visible | char(1) | 是否可见 0可见 1隐藏 |
| status | char(1) | 状态 |
| create_by | varchar(64) | 创建者 |
| create_time | datetime | 创建时间 |
| update_by | varchar(64) | 更新者 |
| update_time | datetime | 更新时间 |
| remark | varchar(500) | 备注 |

## sys_dept 字段

| 字段 | 类型 | 说明 |
|------|------|------|
| id | bigint | 主键 |
| parent_id | bigint | 父部门ID |
| ancestors | varchar(50) | 祖级列表 |
| dept_name | varchar(30) | 部门名称 |
| sort | int | 显示顺序 |
| leader | varchar(20) | 负责人 |
| phone | varchar(11) | 联系电话 |
| email | varchar(50) | 邮箱 |
| status | char(1) | 状态 |
| del_flag | char(1) | 删除标志 |
| create_by | varchar(64) | 创建者 |
| create_time | datetime | 创建时间 |
| update_by | varchar(64) | 更新者 |
| update_time | datetime | 更新时间 |

## sys_dict_type 字段

| 字段 | 类型 | 说明 |
|------|------|------|
| id | bigint | 主键 |
| dict_name | varchar(100) | 字典名称 |
| dict_type | varchar(100) | 字典类型 |
| status | char(1) | 状态 |
| create_by | varchar(64) | 创建者 |
| create_time | datetime | 创建时间 |
| update_by | varchar(64) | 更新者 |
| update_time | datetime | 更新时间 |
| remark | varchar(500) | 备注 |

## sys_dict_data 字段

| 字段 | 类型 | 说明 |
|------|------|------|
| id | bigint | 主键 |
| dict_type | varchar(100) | 字典类型 |
| dict_label | varchar(100) | 字典标签 |
| dict_value | varchar(100) | 字典值 |
| dict_sort | int | 字典排序 |
| css_class | varchar(100) | 样式属性 |
| list_class | varchar(100) | 表格回显样式 |
| is_default | char(1) | 是否默认 Y是 N否 |
| status | char(1) | 状态 |
| create_by | varchar(64) | 创建者 |
| create_time | datetime | 创建时间 |
| update_by | varchar(64) | 更新者 |
| update_time | datetime | 更新时间 |
| remark | varchar(500) | 备注 |

## sys_user_role 字段

| 字段 | 类型 | 说明 |
|------|------|------|
| id | bigint | 主键 |
| user_id | bigint | 用户ID |
| role_id | bigint | 角色ID |

## sys_role_menu 字段

| 字段 | 类型 | 说明 |
|------|------|------|
| id | bigint | 主键 |
| role_id | bigint | 角色ID |
| menu_id | bigint | 菜单ID |

## sys_oper_log 字段

| 字段 | 类型 | 说明 |
|------|------|------|
| id | bigint | 主键 |
| title | varchar(50) | 模块标题 |
| business_type | int | 业务类型 0其它 1新增 2修改 3删除 |
| method | varchar(200) | 方法名称 |
| request_method | varchar(10) | 请求方式 |
| operator_type | int | 操作类别 0其它 1后台用户 2手机端用户 |
| oper_name | varchar(50) | 操作人员 |
| oper_url | varchar(255) | 请求URL |
| oper_ip | varchar(128) | 主机地址 |
| oper_param | text | 请求参数 |
| json_result | text | 返回参数 |
| status | int | 状态 0正常 1异常 |
| error_msg | text | 错误消息 |
| oper_time | datetime | 操作时间 |

## sys_logininfor 字段

| 字段 | 类型 | 说明 |
|------|------|------|
| id | bigint | 主键 |
| username | varchar(50) | 用户账号 |
| ipaddr | varchar(128) | 登录IP |
| login_location | varchar(255) | 登录地点 |
| browser | varchar(50) | 浏览器 |
| os | varchar(50) | 操作系统 |
| status | int | 状态 0成功 1失败 |
| msg | varchar(255) | 提示消息 |
| login_time | datetime | 访问时间 |

## 产出文件

1. docker/mysql/init/flowboot-system.sql（建表 + 初始数据）
2. flowboot-common/src/main/java/com/flowboot/common/entity/BaseEntity.java
3. flowboot-system/src/main/java/com/flowboot/system/entity/ 下 10 个实体类
4. flowboot-system/src/main/java/com/flowboot/system/mapper/ 下 10 个 Mapper 接口

## 本阶段不做

- 不写 Service 层
- 不写 Controller 层
- 不写前端
