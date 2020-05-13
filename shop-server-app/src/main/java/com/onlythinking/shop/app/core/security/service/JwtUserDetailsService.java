package com.onlythinking.shop.app.core.security.service;

import com.onlythinking.shop.app.core.security.JwtUserFactory;
import com.onlythinking.shop.app.core.security.UserUniqueKey;
import com.onlythinking.shop.app.user.service.UserLoginService;
import com.onlythinking.shop.core.model.MaType;
import com.onlythinking.shop.model.OtUserLogin;
import com.onlythinking.shop.model.OtUserMaSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
public class JwtUserDetailsService implements UserDetailsService {

    private final UserLoginService userLoginService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserUniqueKey userUniqueKey = UserUniqueKey.splitUniqueKey(username);
        if (null == userUniqueKey) {
            throw new UsernameNotFoundException(String.format("No user found with username '%s'.", username));
        }
        OtUserLogin user = userLoginService.findByUniqueKey(userUniqueKey.getAppNo(), userUniqueKey.getMaType(), userUniqueKey.getUniqueKey());
        if (null == user) {
            if (MaType.wx.equals(userUniqueKey.getMaType())
              || MaType.swan.equals(userUniqueKey.getMaType())
              || MaType.tt.equals(userUniqueKey.getMaType())
              || MaType.my.equals(userUniqueKey.getMaType())) {
                OtUserMaSession maSession = userLoginService.findMaSessionByOpenid(userUniqueKey.getAppNo(), userUniqueKey.getMaType(), userUniqueKey.getUniqueKey());

                if (null == maSession) {
                    throw new UsernameNotFoundException(String.format("No user found with username '%s'.", username));
                }
                return JwtUserFactory.create(maSession, username);
            } else {
                throw new UsernameNotFoundException(String.format("No user found with username '%s'.", username));
            }
        }
        return JwtUserFactory.create(user);
    }
}
