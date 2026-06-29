package com.flowboot.workflow.components.id;


/**
 * @author xxx-yex
 */
public class IdUtil {
    /**
     * 默认的id生成器
     */
    public static IdGenerator DEFAULT_ID_PRODUCER = new IdGenerator();

    /**
     * 生成全局id
     *
     * @return
     */
    public static Long genId() {
        return DEFAULT_ID_PRODUCER.nextId();
    }
}
