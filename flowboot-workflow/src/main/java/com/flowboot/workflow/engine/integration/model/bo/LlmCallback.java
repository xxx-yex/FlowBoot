package com.flowboot.workflow.engine.integration.model.bo;

import org.springframework.ai.chat.model.ChatResponse;

/**
 * @author xxx-yex
 */
public interface LlmCallback {

    void onResponse(ChatResponse response);

}
