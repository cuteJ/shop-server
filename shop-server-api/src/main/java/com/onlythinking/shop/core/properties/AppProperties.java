package com.onlythinking.shop.core.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
@ConfigurationProperties(prefix = "app", ignoreUnknownFields = true)
public class AppProperties {

    private HttpClient httpclient = new HttpClient();
    private TaskPool taskPool = new TaskPool();

    @Data
    public static class HttpClient {
        private Client http = new Client();
        private ThirdPool pool = new ThirdPool();

        // 单位秒
        @Data
        public static class Client {
            private Long connectTimeout = 60L;
            private Long readTimeout = 60L;
            private Long writeTimeout = 60L;
            private boolean retry = true;
        }

        @Data
        public static class ThirdPool {
            // 单位分钟
            private final int maxIdleConnections = 5;
            private final long keepAliveDurationNs = 5L;
        }
    }

    @Data
    public static class TaskPool {
        private int coreSize = 1;
        private int maxSize = Integer.MAX_VALUE;
        private int queueCapacity = Integer.MAX_VALUE;
        private int keepAlive = 120;
        private String threadPrefix;
    }

}
