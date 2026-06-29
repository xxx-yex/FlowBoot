package com.flowboot.workflow.engine.constants;

import lombok.Getter;

/**
 * 会话状态
 *
 * @author xxx-yex
 */
@Getter
public enum ChatStatusEnum {
    PING("ping"),
    RUNNING("running"),
    STOP("stop"),
    ERROR("interrupt"),
    ;

    private String status;

    ChatStatusEnum(String status) {
        this.status = status;
    }
}
