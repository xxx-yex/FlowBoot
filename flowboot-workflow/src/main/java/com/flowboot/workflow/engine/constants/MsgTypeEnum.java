package com.flowboot.workflow.engine.constants;

/**
 * @author xxx-yex
 */
public enum MsgTypeEnum {
    SYSTEM("system"),
    USER("user"),
    ASSISTANT("assistant"),
    THINKING("thinking");
    private String type;
    MsgTypeEnum(String type) {
        this.type = type;
    }
    public String getType() {
        return type;
    }
}
