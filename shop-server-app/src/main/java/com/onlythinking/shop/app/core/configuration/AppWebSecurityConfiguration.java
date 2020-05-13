package com.onlythinking.shop.app.core.configuration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlythinking.shop.app.core.security.JwtAuthenticationEntryPoint;
import com.onlythinking.shop.app.core.security.JwtAuthorizationTokenFilter;
import com.onlythinking.shop.app.core.security.JwtTokenUtil;
import com.onlythinking.shop.app.core.security.service.JwtUserDetailsService;
import com.onlythinking.shop.core.constant.AppSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.util.Arrays;
import java.util.stream.Collectors;

@Order(Ordered.HIGHEST_PRECEDENCE)
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class AppWebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private JwtAuthenticationEntryPoint unauthorizedHandler;

    @Autowired
    private JwtUserDetailsService jwtUserDetailsService;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Value("${jwt.header}")
    private String tokenHeader;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
          .userDetailsService(jwtUserDetailsService)
          .passwordEncoder(passwordEncoder());
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
          .csrf().disable()
          .exceptionHandling()
          .authenticationEntryPoint(unauthorizedHandler)
          .and()
          .sessionManagement()
          .sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        http.requestMatchers()
          .antMatchers("/api/app/**")
          .and()
          .authorizeRequests()
          .antMatchers(EXCLUDE_PATTERNS).permitAll()
          .antMatchers("/api/app/**").hasAnyAuthority(AppSystem.ROLE_USER)

          .anyRequest().authenticated();

        http
          .addFilterBefore(authenticationTokenFilter(), UsernamePasswordAuthenticationFilter.class);
        http
          .headers()
          .frameOptions().sameOrigin()
          .cacheControl();
    }

    private static final String[] EXCLUDE_PATTERNS = new String[]{"/api/app/auth/**", "/api/app/portal/**", "/api/app/insecure/**"};
    private static final String[] EXCLUDE_PATTERNS_ = new String[]{"/api/app/auth/**"};

    @Bean
    public JwtAuthorizationTokenFilter authenticationTokenFilter() throws Exception {
        JwtAuthorizationTokenFilter filter = new JwtAuthorizationTokenFilter(jwtUserDetailsService, jwtTokenUtil, tokenHeader);
        filter.setExcludePatterns(Arrays.stream(EXCLUDE_PATTERNS_).collect(Collectors.toSet()));
        filter.setObjectMapper(objectMapper);
        return filter;
    }

}
