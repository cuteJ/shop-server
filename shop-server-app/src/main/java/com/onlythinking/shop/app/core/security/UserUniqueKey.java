package com.onlythinking.shop.app.core.security;

import com.google.common.collect.Sets;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.model.MaType;
import com.onlythinking.shop.model.OtUserLogin;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;

import java.util.Set;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
public class UserUniqueKey {
    private String appNo;
    private MaType maType;
    // 唯一值 openid phoneNo username
    private String uniqueKey;

    private static final Set<String> MA_LIST = Sets.newHashSet(
      MaType.wx.name(),
      MaType.swan.name(),
      MaType.tt.name(),
      MaType.my.name()
    );

    public static String uniqueKey(OtUserLogin user) {
        if (StringUtils.isNotBlank(user.getMaType()) && MA_LIST.contains(user.getMaType())) {
            return user.getAppNo() + AppSystem.SEPARATOR_TIME + user.getMaType() + AppSystem.SEPARATOR_TIME + user.getOpenid();
        } else if (StringUtils.isNotBlank(user.getMaType()) && MaType.h5.name().equals(user.getMaType())) {
            return user.getAppNo() + AppSystem.SEPARATOR_TIME + user.getMaType() + AppSystem.SEPARATOR_TIME + user.getPhoneNo();
        } else {
            return user.getUsername();
        }
    }

    public static String uniqueKey(String appNo, String maType, String key) {
        if (StringUtils.isNotBlank(appNo) && StringUtils.isNotBlank(maType)) {
            return appNo + AppSystem.SEPARATOR_TIME + maType + AppSystem.SEPARATOR_TIME + key;
        } else {
            return key;
        }
    }

    public static UserUniqueKey splitUniqueKey(String uniqueKey) {
        if (StringUtils.isBlank(uniqueKey)) {
            return null;
        }
        String[] keys = StringUtils.split(uniqueKey, AppSystem.SEPARATOR_TIME);
        UserUniqueKey dto = new UserUniqueKey();
        if (keys.length == 3) {
            dto.setAppNo(keys[0]);
            dto.setMaType(MaType.valueOf(keys[1]));
            dto.setUniqueKey(keys[2]);
            return dto;
        }
        dto.setUniqueKey(keys[0]);
        return dto;
    }
}
