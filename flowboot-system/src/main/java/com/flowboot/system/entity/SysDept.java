package com.flowboot.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.flowboot.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_dept")
public class SysDept extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private Long parentId;
    private String ancestors;
    private String deptName;
    private Integer sort;
    private String leader;
    private String phone;
    private String email;
    private String status;
}
