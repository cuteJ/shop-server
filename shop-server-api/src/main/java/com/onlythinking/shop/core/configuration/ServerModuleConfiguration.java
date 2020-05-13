package com.onlythinking.shop.core.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Configuration
@Import({
//  CommonsModuleConfiguration.class,
  DataTransactionConfiguration.class,
  MybatisConfiguration.class
})
@EnableAspectJAutoProxy
public class ServerModuleConfiguration {
}
