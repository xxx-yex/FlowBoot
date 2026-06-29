package com.flowboot.workflow.engine.domain;

import com.flowboot.workflow.engine.VariablePool;
import com.flowboot.workflow.engine.domain.chain.Node;
import com.flowboot.workflow.engine.node.callback.WorkflowMsgCallback;

/**
 * node之间执行时传递的状态信息
 *
 * @author xxx-yex
 */
public record NodeState(Node node, VariablePool variablePool, WorkflowMsgCallback callback) {
}
