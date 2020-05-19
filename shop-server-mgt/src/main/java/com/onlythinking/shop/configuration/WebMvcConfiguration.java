package com.onlythinking.shop.configuration;

import com.onlythinking.commons.config.AbstractWebMvcConfiguration;
import com.onlythinking.shop.core.filter.AppCorsProperties;
import com.onlythinking.shop.core.filter.SimpleCORSFilter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.core.env.Environment;
import org.springframework.validation.beanvalidation.MethodValidationPostProcessor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@Configuration
@EnableConfigurationProperties(AppCorsProperties.class)
public class WebMvcConfiguration extends AbstractWebMvcConfiguration {

    private final AppCorsProperties properties;

    @Autowired
    public WebMvcConfiguration(AppCorsProperties properties) {
        this.properties = properties;
    }

    @Bean
    public LocaleResolver localeResolver() {
        return super.localeResolver();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(super.localeChangeInterceptor());
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        return super.localeChangeInterceptor();
    }

    @Bean
    public MessageSource messageSource() {
        return super.messageSource();
    }

    @Bean
    public javax.validation.Validator beanValidator() {
        return super.beanValidator();
    }

    @Bean
    public MethodValidationPostProcessor methodValidationPostProcessor(Environment environment) {
        return super.methodValidationPostProcessor(environment);
    }

    @Bean
    public MessageSourceAccessor messageSourceAccessor() {
        return super.messageSourceAccessor();
    }

    @Bean
    public SimpleCORSFilter simpleCORSFilter() {
        return new SimpleCORSFilter(properties);
    }
}
