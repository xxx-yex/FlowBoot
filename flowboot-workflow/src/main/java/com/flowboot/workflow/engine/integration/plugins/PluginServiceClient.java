package com.flowboot.workflow.engine.integration.plugins;

import com.flowboot.workflow.engine.domain.NodeState;
import com.flowboot.workflow.engine.domain.chain.Node;
import com.flowboot.workflow.engine.integration.plugins.aitools.AiToolsIntegration;
import com.flowboot.workflow.engine.integration.plugins.tts.TtsIntegration;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author xxx-yex
 */
@Slf4j
@Service
public class PluginServiceClient {
    @Autowired
    private AiToolsIntegration aiToolsIntegration;
    @Autowired
    private List<TtsIntegration> smartTTSIntegration;

    @Value("${tts.source:qwen}")
    private String ttsSource;

    public Map<String, Object> toolCall(NodeState nodeState, Map<String, Object> inputs) throws Exception {
        Node node = nodeState.node();
        Map<String, Object> output;
        if (Objects.equals(node.getData().getNodeParam().get("pluginId"), "tool@8b2262bef821000")) {
            // TTS 工具
            output = getTtsIntegration().call(nodeState, inputs);
        } else {
            output = aiToolsIntegration.call(nodeState, inputs);
        }

        return output;
    }

    public TtsIntegration getTtsIntegration() {
        for (TtsIntegration ttsIntegration : smartTTSIntegration) {
            if (Objects.equals(ttsIntegration.source(), ttsSource)) {
                return ttsIntegration;
            }
        }
        throw new RuntimeException("TTS 源不存在");
    }
}
