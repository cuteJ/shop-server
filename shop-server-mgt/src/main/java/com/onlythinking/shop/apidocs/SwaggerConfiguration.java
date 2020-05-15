package com.onlythinking.shop.apidocs;

import com.fasterxml.classmate.TypeResolver;
import com.google.common.collect.Sets;
import com.onlythinking.shop.core.constant.AppSystem;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StopWatch;
import org.springframework.web.context.request.async.DeferredResult;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.WildcardType;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger.web.UiConfiguration;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.time.Instant;
import java.util.Date;

import static com.google.common.collect.Lists.newArrayList;
import static springfox.documentation.builders.PathSelectors.ant;
import static springfox.documentation.schema.AlternateTypeRules.newRule;

/**
 * @author Li Xingping
 */
@Slf4j
@Profile(AppSystem.SPRING_PROFILE_DOC)
@Configuration
@EnableSwagger2
@EnableConfigurationProperties(ApiInfoProperties.class)
public class SwaggerConfiguration {

    @Autowired
    private ApiInfoProperties properties;

    @Value("${server.context-path}")
    private String contentPath;

    @Bean
    public Docket restApi() {
        log.debug("开始 Swagger");
        StopWatch watch = new StopWatch();
        watch.start();
        Docket docket = new Docket(DocumentationType.SWAGGER_2)
          .protocols(Sets.newHashSet("http"))
          .host(properties.getUrl())
          .pathProvider(new FixedPathProvider())
          .apiInfo(apiInfo(properties))
          .forCodeGeneration(true)
          .select()
          .apis(RequestHandlerSelectors.basePackage(properties.getBasePackage()))
          .paths(
            ant("/**")
          )
          .build()
          .pathMapping(contentPath)
          .genericModelSubstitutes(ResponseEntity.class)
          .ignoredParameterTypes(java.sql.Date.class)
          .directModelSubstitute(Instant.class, Date.class)
          .directModelSubstitute(java.time.LocalDate.class, java.sql.Date.class)
          .directModelSubstitute(java.time.ZonedDateTime.class, Date.class)
          .directModelSubstitute(java.time.LocalDateTime.class, Date.class)
          .alternateTypeRules(
            newRule(typeResolver.resolve(DeferredResult.class,
              typeResolver.resolve(ResponseEntity.class, WildcardType.class)),
              typeResolver.resolve(WildcardType.class)))
          .useDefaultResponseMessages(false)
          .securitySchemes(newArrayList(apiKey()))
          // Fix swagger ui query param
          .enableUrlTemplating(false);
        watch.stop();
        log.debug("Started Swagger in {} ms", watch.getTotalTimeMillis());
        return docket;
    }

    @Autowired
    private TypeResolver typeResolver;

    private ApiKey apiKey() {
        return new ApiKey("认证", "Authorization", "header");
    }

    @Bean
    UiConfiguration uiConfig() {
        return new UiConfiguration(
          "validatorUrl",// url
          "none",       // docExpansion          => none | list
          "alpha",      // apiSorter             => alpha
          "schema",     // defaultModelRendering => schema
          UiConfiguration.Constants.DEFAULT_SUBMIT_METHODS,
          true,        // enableJsonEditor      => true | false
          true,         // showRequestHeaders    => true | false
          180000L);      // requestTimeout => in milliseconds, defaults to null (uses jquery xh timeout)
    }

    private ApiInfo apiInfo(ApiInfoProperties properties) {
        return new ApiInfoBuilder()
          .title(properties.getTitle())
          .description(properties.getDescription())
          .contact(new Contact(properties.getAuthor(), properties.getUrl(), properties.getEmail()))
          .version(properties.getVersion())
          .build();
    }
}
