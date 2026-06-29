package com.flowboot.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.flowboot.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_user")
public class SysUser extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private Long deptId;
    private String username;
    private String nickname;
    private String email;
    private String phone;
    private String sex;
    private String avatar;
    private String password;
    private String status;
    private String loginIp;
    private LocalDateTime loginDate;
}
