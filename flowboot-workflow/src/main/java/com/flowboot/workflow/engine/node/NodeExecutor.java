package com.flowboot.workflow.engine.node;

import com.flowboot.workflow.engine.constants.NodeTypeEnum;
import com.flowboot.workflow.engine.domain.NodeRunResult;
import com.flowboot.workflow.engine.domain.NodeState;

/**
 * Base interface for all node executors
 * Each node type (Start, LLM, Plugin, End) must implement this interface
 */
public interface NodeExecutor {

    /**
     * Execute the node logic
     *
     * @param nodeState workflow nodeState
     * @throws Exception if execution fails
     */
    NodeRunResult execute(NodeState nodeState) throws Exception;

    /**
     * Get the node type this executor handles
     *
     * @return node type string (e.g., "node-start", "node-llm", "node-plugin", "node-end")
     */
    NodeTypeEnum getNodeType();
}
