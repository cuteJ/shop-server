package com.onlythinking.shop.configuration;

import com.onlythinking.commons.core.track.SimpleProcessTracking;
import com.onlythinking.commons.exception.RestErrorController;
import com.onlythinking.commons.helper.MessagesHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorAttributes;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author Li Xingping
 */
@Slf4j
@Configuration
public class CustomCommonsConfiguration {

    private final MessageSource messageSource;

    @Autowired
    public CustomCommonsConfiguration(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @Bean
    public CustomExceptionHandler respondedExceptionHandler(ServerProperties serverProperties,
                                                            ErrorAttributes errorAttributes) {
        return new CustomExceptionHandler(serverProperties.getError(), errorAttributes, messageSource);
    }

    @Bean
    public RestErrorController restErrorController(ServerProperties serverProperties,
                                                   ErrorAttributes errorAttributes) {
        return new RestErrorController(serverProperties.getError(), errorAttributes, messageSource);
    }

    @Bean
    public MessagesHelper messagesHelper() {
        return new MessagesHelper(messageSource);
    }

    @Bean
    public SimpleProcessTracking simpleProcessTracking() {
        return new SimpleProcessTracking();
    }

}
