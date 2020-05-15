package com.onlythinking.shop.mgt.core.configuration;

import com.onlythinking.shop.mgt.core.security.ShiroRealm;
import com.onlythinking.shop.mgt.core.security.filter.RestPermissionsAuthorizationFilter;
import com.onlythinking.shop.mgt.core.security.session.SessionListenerLogger;
import com.onlythinking.shop.mgt.core.service.ShiroRealmService;
import org.apache.shiro.authz.Authorizer;
import org.apache.shiro.authz.ModularRealmAuthorizer;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.SessionListener;
import org.apache.shiro.session.mgt.SessionFactory;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.spring.web.config.AbstractShiroWebConfiguration;
import org.apache.shiro.web.servlet.Cookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import static org.apache.commons.lang3.time.DateUtils.MILLIS_PER_SECOND;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Configuration
public class SecurityConfiguration extends AbstractShiroWebConfiguration {

    @Autowired
    private ShiroRealmService shiroRealmService;

    @Bean
    public ShiroRealm shiroRealm() {
        return new ShiroRealm(shiroRealmService);
    }

    @Bean
    @Override
    protected Authorizer authorizer() {
        ModularRealmAuthorizer authorizer = new ModularRealmAuthorizer();
        return authorizer;
    }

    @Bean
    public static DefaultAdvisorAutoProxyCreator getDefaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        /*
         * setUsePrefix(false)用于解决一个奇怪的bug。在引入spring aop的情况下。
         * 在@Controller注解的类的方法中加入@RequiresRole等shiro注解，会导致该方法无法映射请求，导致返回404。
         * 加入这项配置能解决这个bug
         */
        defaultAdvisorAutoProxyCreator.setUsePrefix(true);
        return defaultAdvisorAutoProxyCreator;
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        Map<String, Filter> filterMap = new LinkedHashMap<>();
        filterMap.put("authc", new RestPermissionsAuthorizationFilter());
        shiroFilterFactoryBean.setFilters(filterMap);

        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        filterChainDefinitionMap.put("/", "anon");
        filterChainDefinitionMap.put("/v2/api-docs", "anon");
        filterChainDefinitionMap.put("/swagger-resources", "anon");

        filterChainDefinitionMap.put("/*.html", "anon");
        filterChainDefinitionMap.put("/webjars/**", "anon");
        filterChainDefinitionMap.put("/editor", "anon");
        filterChainDefinitionMap.put("/editor-app/**", "anon");

        filterChainDefinitionMap.put("/static/**", "anon");
        filterChainDefinitionMap.put("/error", "anon");
        filterChainDefinitionMap.put("/mgt/**", "anon");
        filterChainDefinitionMap.put("/api/login/**", "anon");
        filterChainDefinitionMap.put("/api/insecure/**", "anon");
        filterChainDefinitionMap.put("/api/app/**", "anon");
        filterChainDefinitionMap.put("/api/wx/pay/notify/**", "anon");
        filterChainDefinitionMap.put("/**", "authc");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

    @Value("#{@environment['server.session.timeout']}")
    protected Long globalSessionTimeout;

    @Bean
    @Override
    protected SessionDAO sessionDAO() {
        return super.sessionDAO();
    }

    @Bean
    @Override
    protected Cookie sessionCookieTemplate() {
        return super.sessionCookieTemplate();
    }

    @Bean
    @Override
    protected SessionFactory sessionFactory() {
        return super.sessionFactory();
    }

    protected SessionManager nativeSessionManager() {
        DefaultWebSessionManager webSessionManager = new DefaultWebSessionManager();
        webSessionManager.setSessionIdCookieEnabled(sessionIdCookieEnabled);
        webSessionManager.setSessionIdUrlRewritingEnabled(sessionIdUrlRewritingEnabled);
        webSessionManager.setSessionIdCookie(sessionCookieTemplate());

        webSessionManager.setSessionFactory(sessionFactory());
        webSessionManager.setSessionDAO(sessionDAO());
        webSessionManager.setDeleteInvalidSessions(sessionManagerDeleteInvalidSessions);
        if (null != globalSessionTimeout) {
            webSessionManager.setGlobalSessionTimeout(globalSessionTimeout * MILLIS_PER_SECOND);
        }
        ArrayList<SessionListener> listeners = new ArrayList<>();
        listeners.add(sessionListenerLogger());
        webSessionManager.setSessionListeners(listeners);
        return webSessionManager;
    }

    @Bean
    @Override
    protected SessionManager sessionManager() {
        return super.sessionManager();
    }

    @Bean
    public SessionListenerLogger sessionListenerLogger() {
        return new SessionListenerLogger();
    }

}
