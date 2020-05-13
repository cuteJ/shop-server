package com.onlythinking.shop.core.configuration;

import com.onlythinking.shop.core.interceptor.AuditingInterceptor;
import com.onlythinking.shop.core.interceptor.DomainIdGenerateInterceptor;
import org.apache.ibatis.session.LocalCacheScope;
import org.apache.ibatis.type.JdbcType;
import org.mybatis.spring.boot.autoconfigure.ConfigurationCustomizer;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ConditionalOnClass(ConfigurationCustomizer.class)
@Configuration
public class MybatisConfiguration {

    @Bean
    public ConfigurationCustomizer mybatisConfigurationCustomizer() {
        return configuration -> {
            configuration.setLazyLoadingEnabled(true);
            configuration.setLocalCacheScope(LocalCacheScope.STATEMENT);
            configuration.setCallSettersOnNulls(true);
            configuration.setJdbcTypeForNull(JdbcType.NULL);
//            configuration.addInterceptor(new DisabledFilterInterceptor());
            configuration.addInterceptor(new DomainIdGenerateInterceptor());
            configuration.addInterceptor(new AuditingInterceptor());
        };
    }
}
