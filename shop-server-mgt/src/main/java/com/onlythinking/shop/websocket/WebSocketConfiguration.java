package com.onlythinking.shop.websocket;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@Configuration
public class WebSocketConfiguration {

    @Bean
    public ServerEndpointExporter endpointExporter() {
        return new ServerEndpointExporter();
    }

}
