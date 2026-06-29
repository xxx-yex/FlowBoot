package com.flowboot.workflow.engine.integration.model.bo;

import org.springframework.ai.chat.metadata.Usage;

/**
 * @author xxx-yex
 */
public record LlmResVo(Usage usage, String content, String thinkContent) {
}
