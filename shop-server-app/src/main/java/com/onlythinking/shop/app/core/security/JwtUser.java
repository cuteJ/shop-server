package com.onlythinking.shop.app.core.security;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
public class JwtUser implements UserDetails {

    private final String id;
    // 用户唯一键值 (username||appNo:maType:(openid|phoneNo))
    private final String uniqueKey;
    private String password;
    private final Collection<? extends GrantedAuthority> authorities;

    public JwtUser(String id, String uniqueKey, String password, Collection<? extends GrantedAuthority> authorities) {
        this.id = id;
        this.uniqueKey = uniqueKey;
        this.password = password;
        this.authorities = authorities;
    }

    @JsonIgnore
    public String getId() {
        return id;
    }

    @Override
    public String getUsername() {
        return uniqueKey;
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @JsonIgnore
    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}
