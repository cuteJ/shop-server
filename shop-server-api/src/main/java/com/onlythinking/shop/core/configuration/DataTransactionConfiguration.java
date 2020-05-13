package com.onlythinking.shop.core.configuration;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.transaction.PlatformTransactionManagerCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.support.AbstractPlatformTransactionManager;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@Configuration
@ConditionalOnClass(PlatformTransactionManagerCustomizer.class)
public class DataTransactionConfiguration {

    @Bean
    PlatformTransactionManagerCustomizer<AbstractPlatformTransactionManager> transactionManagerCustomizer() {
        return transactionManager -> {
            log.info("Customizer transaction setting..");
            transactionManager.setDefaultTimeout(300);
        };
    }
}
