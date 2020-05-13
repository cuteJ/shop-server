package com.onlythinking.shop.app.core.ma.config;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.api.impl.WxMaServiceImpl;
import cn.binarywang.wx.miniapp.bean.WxMaKefuMessage;
import cn.binarywang.wx.miniapp.bean.WxMaMessage;
import cn.binarywang.wx.miniapp.config.impl.WxMaDefaultConfigImpl;
import cn.binarywang.wx.miniapp.message.WxMaMessageHandler;
import cn.binarywang.wx.miniapp.message.WxMaMessageRouter;
import cn.binarywang.wx.miniapp.message.WxMaXmlOutMessage;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Maps;
import com.onlythinking.shop.app.brand.service.AppBrandService;
import com.onlythinking.shop.app.core.ma.service.DefaultSwanMaService;
import com.onlythinking.shop.app.core.ma.service.SwanMaService;
import com.onlythinking.shop.core.model.MaType;
import com.onlythinking.shop.model.OtAppMaConfig;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;
import java.util.Map;

/**
 * 小程序服务配置
 */
@Slf4j
@Configuration
public class MaConfiguration {

    private final WxMaMessageHandler logHandler = (wxMessage, context, service, sessionManager) -> {
        log.info("小程序收到消息：{}", wxMessage.toString());
        service.getMsgService().sendKefuMsg(WxMaKefuMessage.newTextBuilder()
          .content("收到信息为：" + wxMessage.toJson())
          .toUser(wxMessage.getFromUser())
          .build()
        );
        return out(wxMessage);
    };
    // 客户打开客服会话
    private final WxMaMessageHandler userEnterTempSessionHandler = (wxMessage, context, service, sessionManager) -> {
        service.getMsgService().sendKefuMsg(WxMaKefuMessage.newTextBuilder()
          .content("您好先生(女士),请问有什么可以帮您?")
          .toUser(wxMessage.getFromUser()).build());
        return out(wxMessage);
    };

    private WxMaXmlOutMessage out(WxMaMessage wxMessage) {
        return WxMaXmlOutMessage.builder()
          .toUserName(wxMessage.getToUser())
          .fromUserName(wxMessage.getFromUser())
          .msgType(wxMessage.getMsgType())
          .createTime(Long.valueOf(wxMessage.getCreateTime()))
          .build();
    }

    private static Map<String, WxMaMessageRouter> wxMaRouters = Maps.newHashMap();
    private static Map<String, WxMaService> wxMaServices = Maps.newHashMap();
    private static Map<String, SwanMaService> swanMaServices = Maps.newHashMap();

    @Autowired
    public MaConfiguration(AppBrandService appBrandService, ObjectMapper objectMapper) {
        this.appBrandService = appBrandService;
        this.objectMapper = objectMapper;
    }

    public static Map<String, WxMaMessageRouter> getWxMaRouters() {
        return wxMaRouters;
    }

    public static WxMaService getWxMaService(String appNo) {
        WxMaService wxService = wxMaServices.get(appNo);
        if (wxService == null) {
            throw new IllegalArgumentException(String.format("未找到对应appNo=[%s]的配置，请核实微信小程序！", appNo));
        }
        return wxService;
    }

    public static SwanMaService getSwanMaService(String appNo) {
        SwanMaService swanMaService = swanMaServices.get(appNo);
        if (swanMaService == null) {
            throw new IllegalArgumentException(String.format("未找到对应appNo=[%s]的配置，请核实百度小程序！", appNo));
        }
        return swanMaService;
    }

    private final AppBrandService appBrandService;
    private final ObjectMapper objectMapper;

    @Bean
    public Object services() {
        Map<MaType, List<OtAppMaConfig>> configsOf = appBrandService.getAll();
        // TODO 生产环境持久化
        if (null != configsOf && CollectionUtils.isNotEmpty(configsOf.get(MaType.wx))) {
            configsOf.get(MaType.wx).forEach(a -> {
                WxMaDefaultConfigImpl config = new WxMaDefaultConfigImpl();
                config.setAppid(a.getAppId());
                config.setSecret(a.getSecret());
                config.setToken(a.getToken());
                config.setAesKey(a.getAesKey());
                config.setMsgDataFormat(a.getMsgDataFormat());

                WxMaService service = new WxMaServiceImpl();
                service.setWxMaConfig(config);
                wxMaRouters.put(a.getAppNo(), this.newRouter(service));
                wxMaServices.put(a.getAppNo(), service);
            });
        }

        if (null != configsOf &&  CollectionUtils.isNotEmpty(configsOf.get(MaType.swan))) {
            configsOf.get(MaType.swan).forEach(a -> {
                DefaultSwanMaConfig config = new DefaultSwanMaConfig();
                config.setAppid(a.getAppId());
                config.setAppKey(a.getAppKey());
                config.setSecret(a.getSecret());

                SwanMaService service = new DefaultSwanMaService(objectMapper, config);
                swanMaServices.put(a.getAppNo(), service);
            });
        }

        return Boolean.TRUE;
    }

    private WxMaMessageRouter newRouter(WxMaService service) {
        final WxMaMessageRouter router = new WxMaMessageRouter(service);
        router
          .rule().handler(logHandler).next()
          .rule().async(false).event("user_enter_tempsession").handler(userEnterTempSessionHandler).end();
        return router;
    }

}
