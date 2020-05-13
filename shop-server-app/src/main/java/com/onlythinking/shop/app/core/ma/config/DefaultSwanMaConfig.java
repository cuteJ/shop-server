package com.onlythinking.shop.app.core.ma.config;

import lombok.Getter;
import lombok.Setter;

/**
 * 百度小程序配置
 *
 * @author Li Xingping
 */
@Setter
@Getter
public class DefaultSwanMaConfig extends DefaultMaConfig implements SwanMaConfig {

    protected volatile String appKey;
}
