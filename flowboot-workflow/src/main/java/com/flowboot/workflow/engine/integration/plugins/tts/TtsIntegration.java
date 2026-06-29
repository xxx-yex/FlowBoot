package com.flowboot.workflow.engine.integration.plugins.tts;

import com.flowboot.workflow.engine.domain.NodeState;

import java.util.Map;

/**
 * @author xxx-yex
 */
public interface TtsIntegration {
    String source();

    Map<String, Object> call(NodeState nodeState, Map<String, Object> inputs) throws Exception;
}
