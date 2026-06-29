-- =============================================
-- FlowBoot 系统管理表
-- =============================================

-- 1. 部门表
DROP TABLE IF EXISTS sys_dept;
CREATE TABLE sys_dept (
  id            bigint       NOT NULL AUTO_INCREMENT COMMENT '部门id',
  parent_id     bigint       DEFAULT 0                COMMENT '父部门id',
  ancestors     varchar(50)  DEFAULT ''               COMMENT '祖级列表',
  dept_name     varchar(30)  DEFAULT ''               COMMENT '部门名称',
  sort          int          DEFAULT 0                COMMENT '显示顺序',
  leader        varchar(20)  DEFAULT NULL             COMMENT '负责人',
  phone         varchar(11)  DEFAULT NULL             COMMENT '联系电话',
  email         varchar(50)  DEFAULT NULL             COMMENT '邮箱',
  status        char(1)      DEFAULT '0'              COMMENT '状态（0正常 1停用）',
  del_flag      char(1)      DEFAULT '0'              COMMENT '删除标志（0存在 2删除）',
  create_by     varchar(64)  DEFAULT ''               COMMENT '创建者',
  create_time   datetime                              COMMENT '创建时间',
  update_by     varchar(64)  DEFAULT ''               COMMENT '更新者',
  update_time   datetime                              COMMENT '更新时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=200 COMMENT='部门表';

INSERT INTO sys_dept VALUES (100, 0, '0', 'FlowBoot科技', 0, 'FlowBoot', '15888888888', 'fb@flowboot.com', '0', '0', 'admin', sysdate(), '', NULL);
INSERT INTO sys_dept VALUES (101, 100, '0,100', '深圳总公司', 1, 'FlowBoot', '15888888888', 'fb@flowboot.com', '0', '0', 'admin', sysdate(), '', NULL);
INSERT INTO sys_dept VALUES (102, 100, '0,100', '长沙分公司', 2, 'FlowBoot', '15888888888', 'fb@flowboot.com', '0', '0', 'admin', sysdate(), '', NULL);
INSERT INTO sys_dept VALUES (103, 101, '0,100,101', '研发部门', 1, 'FlowBoot', '15888888888', 'fb@flowboot.com', '0', '0', 'admin', sysdate(), '', NULL);
INSERT INTO sys_dept VALUES (104, 101, '0,100,101', '市场部门', 2, 'FlowBoot', '15888888888', 'fb@flowboot.com', '0', '0', 'admin', sysdate(), '', NULL);
INSERT INTO sys_dept VALUES (105, 101, '0,100,101', '测试部门', 3, 'FlowBoot', '15888888888', 'fb@flowboot.com', '0', '0', 'admin', sysdate(), '', NULL);


-- 2. 用户表
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  id            bigint       NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  dept_id       bigint       DEFAULT NULL             COMMENT '部门ID',
  username      varchar(30)  NOT NULL                 COMMENT '登录账号',
  nickname      varchar(30)  DEFAULT ''               COMMENT '用户昵称',
  email         varchar(50)  DEFAULT ''               COMMENT '邮箱',
  phone         varchar(11)  DEFAULT ''               COMMENT '手机号码',
  sex           char(1)      DEFAULT '0'              COMMENT '性别（0男 1女 2未知）',
  avatar        varchar(200) DEFAULT ''               COMMENT '头像地址',
  password      varchar(100) DEFAULT ''               COMMENT '密码',
  status        char(1)      DEFAULT '0'              COMMENT '状态（0正常 1停用）',
  del_flag      char(1)      DEFAULT '0'              COMMENT '删除标志（0存在 2删除）',
  login_ip      varchar(128) DEFAULT ''               COMMENT '最后登录IP',
  login_date    datetime                              COMMENT '最后登录时间',
  create_by     varchar(64)  DEFAULT ''               COMMENT '创建者',
  create_time   datetime                              COMMENT '创建时间',
  update_by     varchar(64)  DEFAULT ''               COMMENT '更新者',
  update_time   datetime                              COMMENT '更新时间',
  remark        varchar(500) DEFAULT NULL             COMMENT '备注',
  PRIMARY KEY (id),
  UNIQUE KEY uk_username (username)
) ENGINE=InnoDB AUTO_INCREMENT=100 COMMENT='用户表';

INSERT INTO sys_user VALUES (1, 103, 'admin', 'FlowBoot', 'admin@flowboot.com', '15888888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', sysdate(), 'admin', sysdate(), '', NULL, '管理员');
INSERT INTO sys_user VALUES (2, 105, 'ry', '若依', 'ry@flowboot.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', sysdate(), 'admin', sysdate(), '', NULL, '测试员');


-- 3. 角色表
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
  id            bigint       NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  role_name     varchar(30)  NOT NULL                 COMMENT '角色名称',
  role_key      varchar(100) NOT NULL                 COMMENT '角色权限字符串',
  sort          int          NOT NULL                 COMMENT '显示顺序',
  data_scope    char(1)      DEFAULT '1'              COMMENT '数据范围（1=全部 2=自定义 3=本部门 4=本部门及以下 5=仅本人）',
  status        char(1)      DEFAULT '0'              COMMENT '状态（0正常 1停用）',
  del_flag      char(1)      DEFAULT '0'              COMMENT '删除标志（0存在 2删除）',
  create_by     varchar(64)  DEFAULT ''               COMMENT '创建者',
  create_time   datetime                              COMMENT '创建时间',
  update_by     varchar(64)  DEFAULT ''               COMMENT '更新者',
  update_time   datetime                              COMMENT '更新时间',
  remark        varchar(500) DEFAULT NULL             COMMENT '备注',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=100 COMMENT='角色表';

INSERT INTO sys_role VALUES (1, '超级管理员', 'super_admin', 1, '1', '0', '0', 'admin', sysdate(), '', NULL, '超级管理员');
INSERT INTO sys_role VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', sysdate(), '', NULL, '普通角色');


-- 4. 菜单表
DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu (
  id            bigint       NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  parent_id     bigint       DEFAULT 0                COMMENT '父菜单ID',
  menu_name     varchar(50)  NOT NULL                 COMMENT '菜单名称',
  menu_type     char(1)      NOT NULL                 COMMENT '类型（M=目录 C=菜单 F=按钮）',
  path          varchar(200) DEFAULT ''               COMMENT '路由地址',
  component     varchar(200) DEFAULT NULL             COMMENT '组件路径',
  perm          varchar(100) DEFAULT NULL             COMMENT '权限标识',
  icon          varchar(100) DEFAULT ''               COMMENT '菜单图标',
  sort          int          DEFAULT 0                COMMENT '显示顺序',
  visible       char(1)      DEFAULT '0'              COMMENT '是否可见（0可见 1隐藏）',
  status        char(1)      DEFAULT '0'              COMMENT '状态（0正常 1停用）',
  create_by     varchar(64)  DEFAULT ''               COMMENT '创建者',
  create_time   datetime                              COMMENT '创建时间',
  update_by     varchar(64)  DEFAULT ''               COMMENT '更新者',
  update_time   datetime                              COMMENT '更新时间',
  remark        varchar(500) DEFAULT NULL             COMMENT '备注',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=2000 COMMENT='菜单表';

-- 一级目录
INSERT INTO sys_menu VALUES (1, 0, '系统管理', 'M', '/system', NULL, '', 'setting', 1, '0', '0', 'admin', sysdate(), '', NULL, '系统管理目录');
INSERT INTO sys_menu VALUES (2, 0, '工作流',   'M', '/workflow', NULL, '', 'apartment', 2, '0', '0', 'admin', sysdate(), '', NULL, '工作流目录');
INSERT INTO sys_menu VALUES (3, 0, '资源管理', 'M', '/resource', NULL, '', 'cloud-server', 3, '0', '0', 'admin', sysdate(), '', NULL, '资源管理目录');

-- 系统管理子菜单
INSERT INTO sys_menu VALUES (100, 1, '用户管理', 'C', 'user', 'system/user/index', 'system:user:list', 'user', 1, '0', '0', 'admin', sysdate(), '', NULL, '用户管理菜单');
INSERT INTO sys_menu VALUES (101, 1, '角色管理', 'C', 'role', 'system/role/index', 'system:role:list', 'peoples', 2, '0', '0', 'admin', sysdate(), '', NULL, '角色管理菜单');
INSERT INTO sys_menu VALUES (102, 1, '菜单管理', 'C', 'menu', 'system/menu/index', 'system:menu:list', 'tree-table', 3, '0', '0', 'admin', sysdate(), '', NULL, '菜单管理菜单');
INSERT INTO sys_menu VALUES (103, 1, '部门管理', 'C', 'dept', 'system/dept/index', 'system:dept:list', 'tree', 4, '0', '0', 'admin', sysdate(), '', NULL, '部门管理菜单');
INSERT INTO sys_menu VALUES (104, 1, '字典管理', 'C', 'dict', 'system/dict/index', 'system:dict:list', 'dict', 5, '0', '0', 'admin', sysdate(), '', NULL, '字典管理菜单');
INSERT INTO sys_menu VALUES (105, 1, '操作日志', 'C', 'operlog', 'system/operlog/index', 'system:operlog:list', 'form', 6, '0', '0', 'admin', sysdate(), '', NULL, '操作日志菜单');
INSERT INTO sys_menu VALUES (106, 1, '登录日志', 'C', 'logininfor', 'system/logininfor/index', 'system:logininfor:list', 'logininfor', 7, '0', '0', 'admin', sysdate(), '', NULL, '登录日志菜单');

-- 用户管理按钮
INSERT INTO sys_menu VALUES (1000, 100, '用户查询', 'F', '', '', 'system:user:query',  '', 1, '0', '0', 'admin', sysdate(), '', NULL, '');
INSERT INTO sys_menu VALUES (1001, 100, '用户新增', 'F', '', '', 'system:user:add',    '', 2, '0', '0', 'admin', sysdate(), '', NULL, '');
INSERT INTO sys_menu VALUES (1002, 100, '用户修改', 'F', '', '', 'system:user:edit',   '', 3, '0', '0', 'admin', sysdate(), '', NULL, '');
INSERT INTO sys_menu VALUES (1003, 100, '用户删除', 'F', '', '', 'system:user:remove', '', 4, '0', '0', 'admin', sysdate(), '', NULL, '');
INSERT INTO sys_menu VALUES (1004, 100, '重置密码', 'F', '', '', 'system:user:resetPwd','', 5, '0', '0', 'admin', sysdate(), '', NULL, '');

-- 角色管理按钮
INSERT INTO sys_menu VALUES (1010, 101, '角色查询', 'F', '', '', 'system:role:query',  '', 1, '0', '0', 'admin', sysdate(), '', NULL, '');
INSERT INTO sys_menu VALUES (1011, 101, '角色新增', 'F', '', '', 'system:role:add',    '', 2, '0', '0', 'admin', sysdate(), '', NULL, '');
INSERT INTO sys_menu VALUES (1012, 101, '角色修改', 'F', '', '', 'system:role:edit',   '', 3, '0', '0', 'admin', sysdate(), '', NULL, '');
INSERT INTO sys_menu VALUES (1013, 101, '角色删除', 'F', '', '', 'system:role:remove', '', 4, '0', '0', 'admin', sysdate(), '', NULL, '');


-- 5. 用户角色关联表
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role (
  id      bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  user_id bigint NOT NULL COMMENT '用户ID',
  role_id bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (id),
  KEY idx_user_id (user_id),
  KEY idx_role_id (role_id)
) ENGINE=InnoDB AUTO_INCREMENT=100 COMMENT='用户角色关联表';

INSERT INTO sys_user_role VALUES (1, 1, 1);
INSERT INTO sys_user_role VALUES (2, 2, 2);


-- 6. 角色菜单关联表
DROP TABLE IF EXISTS sys_role_menu;
CREATE TABLE sys_role_menu (
  id      bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  role_id bigint NOT NULL COMMENT '角色ID',
  menu_id bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (id),
  KEY idx_role_id (role_id),
  KEY idx_menu_id (menu_id)
) ENGINE=InnoDB AUTO_INCREMENT=100 COMMENT='角色菜单关联表';

INSERT INTO sys_role_menu VALUES (1, 2, 1);
INSERT INTO sys_role_menu VALUES (2, 2, 100);
INSERT INTO sys_role_menu VALUES (3, 2, 101);
INSERT INTO sys_role_menu VALUES (4, 2, 102);
INSERT INTO sys_role_menu VALUES (5, 2, 103);
INSERT INTO sys_role_menu VALUES (6, 2, 104);
INSERT INTO sys_role_menu VALUES (7, 2, 105);
INSERT INTO sys_role_menu VALUES (8, 2, 106);


-- 7. 字典类型表
DROP TABLE IF EXISTS sys_dict_type;
CREATE TABLE sys_dict_type (
  id            bigint       NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  dict_name     varchar(100) DEFAULT ''               COMMENT '字典名称',
  dict_type     varchar(100) DEFAULT ''               COMMENT '字典类型',
  status        char(1)      DEFAULT '0'              COMMENT '状态（0正常 1停用）',
  create_by     varchar(64)  DEFAULT ''               COMMENT '创建者',
  create_time   datetime                              COMMENT '创建时间',
  update_by     varchar(64)  DEFAULT ''               COMMENT '更新者',
  update_time   datetime                              COMMENT '更新时间',
  remark        varchar(500) DEFAULT NULL             COMMENT '备注',
  PRIMARY KEY (id),
  UNIQUE KEY uk_dict_type (dict_type)
) ENGINE=InnoDB AUTO_INCREMENT=100 COMMENT='字典类型表';

INSERT INTO sys_dict_type VALUES (1, '用户性别', 'sys_user_sex',     '0', 'admin', sysdate(), '', NULL, '用户性别列表');
INSERT INTO sys_dict_type VALUES (2, '菜单状态', 'sys_show_hide',    '0', 'admin', sysdate(), '', NULL, '菜单状态列表');
INSERT INTO sys_dict_type VALUES (3, '系统开关', 'sys_normal_disable','0', 'admin', sysdate(), '', NULL, '系统开关列表');
INSERT INTO sys_dict_type VALUES (4, '操作类型', 'sys_oper_type',    '0', 'admin', sysdate(), '', NULL, '操作类型列表');
INSERT INTO sys_dict_type VALUES (5, '系统是否', 'sys_yes_no',       '0', 'admin', sysdate(), '', NULL, '系统是否列表');


-- 8. 字典数据表
DROP TABLE IF EXISTS sys_dict_data;
CREATE TABLE sys_dict_data (
  id            bigint       NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  dict_type     varchar(100) DEFAULT ''               COMMENT '字典类型',
  dict_label    varchar(100) DEFAULT ''               COMMENT '字典标签',
  dict_value    varchar(100) DEFAULT ''               COMMENT '字典值',
  dict_sort     int          DEFAULT 0                COMMENT '字典排序',
  css_class     varchar(100) DEFAULT NULL             COMMENT '样式属性',
  list_class    varchar(100) DEFAULT NULL             COMMENT '表格回显样式',
  is_default    char(1)      DEFAULT 'N'              COMMENT '是否默认（Y是 N否）',
  status        char(1)      DEFAULT '0'              COMMENT '状态（0正常 1停用）',
  create_by     varchar(64)  DEFAULT ''               COMMENT '创建者',
  create_time   datetime                              COMMENT '创建时间',
  update_by     varchar(64)  DEFAULT ''               COMMENT '更新者',
  update_time   datetime                              COMMENT '更新时间',
  remark        varchar(500) DEFAULT NULL             COMMENT '备注',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=100 COMMENT='字典数据表';

INSERT INTO sys_dict_data VALUES (1, 'sys_user_sex',      '男', '0', 1, '', 'default', 'Y', '0', 'admin', sysdate(), '', NULL, '性别男');
INSERT INTO sys_dict_data VALUES (2, 'sys_user_sex',      '女', '1', 2, '', 'default', 'N', '0', 'admin', sysdate(), '', NULL, '性别女');
INSERT INTO sys_dict_data VALUES (3, 'sys_user_sex',      '未知','2',3, '', 'default', 'N', '0', 'admin', sysdate(), '', NULL, '性别未知');
INSERT INTO sys_dict_data VALUES (4, 'sys_show_hide',     '显示','0',1, '', 'primary','Y', '0', 'admin', sysdate(), '', NULL, '显示菜单');
INSERT INTO sys_dict_data VALUES (5, 'sys_show_hide',     '隐藏','1',2, '', 'danger', 'N', '0', 'admin', sysdate(), '', NULL, '隐藏菜单');
INSERT INTO sys_dict_data VALUES (6, 'sys_normal_disable','正常','0',1, '', 'primary','Y', '0', 'admin', sysdate(), '', NULL, '正常状态');
INSERT INTO sys_dict_data VALUES (7, 'sys_normal_disable','停用','1',2, '', 'danger', 'N', '0', 'admin', sysdate(), '', NULL, '停用状态');
INSERT INTO sys_dict_data VALUES (8, 'sys_oper_type',     '其他','0',1, '', 'info',   'N', '0', 'admin', sysdate(), '', NULL, '其他操作');
INSERT INTO sys_dict_data VALUES (9, 'sys_oper_type',     '新增','1',2, '', 'success','N', '0', 'admin', sysdate(), '', NULL, '新增操作');
INSERT INTO sys_dict_data VALUES (10,'sys_oper_type',     '修改','2',3, '', 'primary','N', '0', 'admin', sysdate(), '', NULL, '修改操作');
INSERT INTO sys_dict_data VALUES (11,'sys_oper_type',     '删除','3',4, '', 'danger', 'N', '0', 'admin', sysdate(), '', NULL, '删除操作');
INSERT INTO sys_dict_data VALUES (12,'sys_yes_no',        '是', 'Y',1, '', 'primary','Y', '0', 'admin', sysdate(), '', NULL, '是');
INSERT INTO sys_dict_data VALUES (13,'sys_yes_no',        '否', 'N',2, '', 'danger', 'N', '0', 'admin', sysdate(), '', NULL, '否');


-- 9. 操作日志表
DROP TABLE IF EXISTS sys_oper_log;
CREATE TABLE sys_oper_log (
  id              bigint       NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  title           varchar(50)  DEFAULT ''               COMMENT '模块标题',
  business_type   int          DEFAULT 0                COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  method          varchar(200) DEFAULT ''               COMMENT '方法名称',
  request_method  varchar(10)  DEFAULT ''               COMMENT '请求方式',
  operator_type   int          DEFAULT 0                COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  oper_name       varchar(50)  DEFAULT ''               COMMENT '操作人员',
  oper_url        varchar(255) DEFAULT ''               COMMENT '请求URL',
  oper_ip         varchar(128) DEFAULT ''               COMMENT '主机地址',
  oper_param      text                                  COMMENT '请求参数',
  json_result     text                                  COMMENT '返回参数',
  status          int          DEFAULT 0                COMMENT '状态（0正常 1异常）',
  error_msg       text                                  COMMENT '错误消息',
  oper_time       datetime                              COMMENT '操作时间',
  PRIMARY KEY (id),
  KEY idx_oper_time (oper_time)
) ENGINE=InnoDB AUTO_INCREMENT=100 COMMENT='操作日志表';


-- 10. 登录日志表
DROP TABLE IF EXISTS sys_logininfor;
CREATE TABLE sys_logininfor (
  id              bigint       NOT NULL AUTO_INCREMENT COMMENT '访问主键',
  username        varchar(50)  DEFAULT ''               COMMENT '用户账号',
  ipaddr          varchar(128) DEFAULT ''               COMMENT '登录IP',
  login_location  varchar(255) DEFAULT ''               COMMENT '登录地点',
  browser         varchar(50)  DEFAULT ''               COMMENT '浏览器',
  os              varchar(50)  DEFAULT ''               COMMENT '操作系统',
  status          int          DEFAULT 0                COMMENT '状态（0成功 1失败）',
  msg             varchar(255) DEFAULT ''               COMMENT '提示消息',
  login_time      datetime                              COMMENT '访问时间',
  PRIMARY KEY (id),
  KEY idx_login_time (login_time)
) ENGINE=InnoDB AUTO_INCREMENT=100 COMMENT='登录日志表';
