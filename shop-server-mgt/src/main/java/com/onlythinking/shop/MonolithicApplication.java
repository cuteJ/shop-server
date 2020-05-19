package com.onlythinking.shop;

import com.onlythinking.commons.config.ApiRestWebMvcRegistrations;
import com.onlythinking.shop.configuration.CustomCommonsConfiguration;
import com.onlythinking.shop.core.configuration.ServerModuleConfiguration;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.WebMvcRegistrationsAdapter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@SpringBootApplication
@Import({ServerModuleConfiguration.class, CustomCommonsConfiguration.class})
@ComponentScan(excludeFilters = {@ComponentScan.Filter(ControllerAdvice.class), @ComponentScan.Filter(RestControllerAdvice.class)})
public class MonolithicApplication {

    public static void main(String... args) throws UnknownHostException {
        SpringApplication app = new SpringApplication(MonolithicApplication.class);
        Environment env = app.run(args).getEnvironment();
        log.info("\n----------------------------------------------------------\n\t" +
            "Application '{}' is running! Access URLs:\n\t" +
            "Local: \t\thttp://127.0.0.1:{}\n\t" +
            "External: \thttp://{}:{}\n----------------------------------------------------------",
          env.getProperty("spring.application.name"),
          env.getProperty("server.port"),
          InetAddress.getLocalHost().getHostAddress(),
          env.getProperty("server.port"));
    }

    @Bean
    public WebMvcRegistrationsAdapter apiRestWebMvcRegistrations() {
        return new ApiRestWebMvcRegistrations();
    }
}

