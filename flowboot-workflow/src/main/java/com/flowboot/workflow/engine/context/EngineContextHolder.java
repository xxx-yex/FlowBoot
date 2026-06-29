package com.flowboot.workflow.engine.context;

import com.alibaba.ttl.TransmittableThreadLocal;
import com.flowboot.workflow.engine.node.callback.WorkflowMsgCallback;
import com.flowboot.workflow.engine.util.FlowUtil;
import lombok.Data;

/**
 * 编排引擎执行上下文
 *
 * @author xxx-yex
 */
public class EngineContextHolder {
    private static TransmittableThreadLocal<EngineContext> contexts = new TransmittableThreadLocal<>();

    public static void set(EngineContext context) {
        contexts.set(context);
    }

    public static EngineContext get() {
        return contexts.get();
    }

    public static void remove() {
        contexts.remove();
    }


    public static EngineContext initContext(String flowId, String chatId, WorkflowMsgCallback workflowCallback) {
        EngineContext context = new EngineContext();
        context.setFlowId(flowId);
        context.setChatId(chatId);
        context.setCallback(workflowCallback);
        context.setSid(FlowUtil.genSid());
        set(context);
        return context;
    }

    @Data
    public static class EngineContext {
        private String flowId;

        private String chatId;

        private WorkflowMsgCallback callback;

        private String sid;
    }
}
