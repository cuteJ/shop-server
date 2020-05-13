package com.onlythinking.shop.app.core.security;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlythinking.commons.exception.GlobalErrorCode;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.shop.core.exception.CoreErrorCode;
import io.jsonwebtoken.ExpiredJwtException;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.UrlPathHelper;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
public class JwtAuthorizationTokenFilter extends OncePerRequestFilter {

    private final UserDetailsService userDetailsService;
    private final JwtTokenUtil jwtTokenUtil;
    private final String tokenHeader;

    @Setter
    private ObjectMapper objectMapper;

    @Setter
    private Set<String> excludePatterns;
    private AntPathMatcher pathMatcher = new AntPathMatcher();

    private final UrlPathHelper urlPathHelper = new UrlPathHelper();

    public JwtAuthorizationTokenFilter(UserDetailsService userDetailsService, JwtTokenUtil jwtTokenUtil,
                                       @Value("${jwt.header}") String tokenHeader) {
        this.userDetailsService = userDetailsService;
        this.jwtTokenUtil = jwtTokenUtil;
        this.tokenHeader = tokenHeader;
    }

    protected boolean shouldNotFilter(HttpServletRequest request) throws ServletException {
        if (CollectionUtils.isNotEmpty(excludePatterns)) {
            String urlPath = this.urlPathHelper.getLookupPathForRequest(request);
            for (String pattern : excludePatterns) {
                if (pathMatcher.match(pattern, urlPath)) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {
        log.debug("processing authentication for '{}'", request.getRequestURL());

        final String requestHeader = request.getHeader(this.tokenHeader);

        String username = null;
        String authToken = null;
        if (StringUtils.isNotBlank(requestHeader) && requestHeader.startsWith("Bearer ")) {
            authToken = requestHeader.substring(7);
        } else {
            authToken = request.getParameter("access_token");
        }
        if (StringUtils.isNotBlank(authToken)) {
            try {
                username = jwtTokenUtil.getUsernameFromToken(authToken);
            } catch (Exception e) {
                if (e instanceof ExpiredJwtException) {
                    log.warn("the token is expired and not valid anymore", e);
                    response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
                    response.getWriter().write(convertObjectToJson(RespondedBody.of(CoreErrorCode.TOKEN_EXPIRED, "Token is expired.")));
                    response.getWriter().flush();
                    return;
                } else {
                    log.error("an error occured during getting username from token", e);
                }
            }
        } else {
            log.warn("couldn't find bearer string, will ignore the header");
        }

        log.debug("checking authentication for user '{}'", username);
        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
            log.debug("security context was null, so authorizating user");
            UserDetails userDetails;
            try {
                userDetails = this.userDetailsService.loadUserByUsername(username);
            } catch (UsernameNotFoundException e) {
                log.warn(e.toString());
                response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
                response.getWriter().write(convertObjectToJson(RespondedBody.of(GlobalErrorCode.SC_UNAUTHORIZED, "Token is invalid.")));
                response.getWriter().flush();
                return;
            }

            if (jwtTokenUtil.validateToken(authToken, userDetails)) {
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                log.info("Authenticated user '{}', setting security context", username);
                SecurityContextHolder.getContext().setAuthentication(authentication);
            }
        }

        chain.doFilter(request, response);
    }

    private String convertObjectToJson(Object object) throws JsonProcessingException {
        if (object == null) {
            return null;
        }
        return objectMapper.writeValueAsString(object);
    }
}
