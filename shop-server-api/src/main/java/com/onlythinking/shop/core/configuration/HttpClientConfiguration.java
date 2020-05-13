package com.onlythinking.shop.core.configuration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlythinking.shop.core.helper.ThirdHttpClient;
import com.onlythinking.shop.core.helper.ThirdHttpClientImpl;
import com.onlythinking.shop.core.properties.AppProperties;
import com.onlythinking.shop.core.utils.IpAddress;
import okhttp3.ConnectionPool;
import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.TimeUnit;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Configuration
@EnableConfigurationProperties(AppProperties.class)
public class HttpClientConfiguration {
    private final AppProperties properties;
    private final ObjectMapper objectMapper;

    @Autowired
    public HttpClientConfiguration(AppProperties properties, ObjectMapper objectMapper) {
        this.properties = properties;
        this.objectMapper = objectMapper;
    }

    @Bean
    public ThirdHttpClient thirdHttpClient() {
        ThirdHttpClientImpl httpClient = new ThirdHttpClientImpl();
        httpClient.setObjectMapper(objectMapper);
        httpClient.setClient(createOkHttp());
        return httpClient;
    }

    @Bean
    public IpAddress ipAddress() {
        return new IpAddress(thirdHttpClient());
    }

    private OkHttpClient createOkHttp() {
        return new OkHttpClient.Builder()
          .addInterceptor(
            new HttpLoggingInterceptor().setLevel(HttpLoggingInterceptor.Level.BODY))
//          .addInterceptor(new GzipRequestInterceptor())
          .connectionPool(new ConnectionPool(properties.getHttpclient().getPool().getMaxIdleConnections(),
            properties.getHttpclient().getPool().getKeepAliveDurationNs(), TimeUnit.MINUTES))
          .connectTimeout(properties.getHttpclient().getHttp().getConnectTimeout(), TimeUnit.SECONDS)
          .readTimeout(properties.getHttpclient().getHttp().getReadTimeout(), TimeUnit.SECONDS)
          .writeTimeout(properties.getHttpclient().getHttp().getWriteTimeout(), TimeUnit.SECONDS)
          .retryOnConnectionFailure(properties.getHttpclient().getHttp().isRetry())
          .build();
    }


}
