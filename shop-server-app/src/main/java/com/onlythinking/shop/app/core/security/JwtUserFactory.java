package com.onlythinking.shop.app.core.security;

import com.google.common.collect.Lists;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.model.OtUserLogin;
import com.onlythinking.shop.model.OtUserMaSession;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public class JwtUserFactory {

    public static JwtUser create(OtUserLogin user) {
        return new JwtUser(
          user.getId(),
          UserUniqueKey.uniqueKey(user),
          user.getPassword(),
          mapToGrantedAuthorities(Lists.newArrayList(AppSystem.ROLE_USER))
        );
    }

    private static List<GrantedAuthority> mapToGrantedAuthorities(List<String> authorities) {
        return authorities.stream()
          .map(SimpleGrantedAuthority::new)
          .collect(Collectors.toList());
    }


    public static UserDetails create(OtUserMaSession user, String uniqueKey) {
        return new JwtUser(
          null,
          uniqueKey,
          null,
          mapToGrantedAuthorities(Lists.newArrayList(AppSystem.ROLE_USER))
        );
    }
}
