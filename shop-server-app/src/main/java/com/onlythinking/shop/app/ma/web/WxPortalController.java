package com.onlythinking.shop.app.ma.web;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaMessage;
import cn.binarywang.wx.miniapp.constant.WxMaConstants;
import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.shop.app.core.ma.config.MaConfiguration;
import com.onlythinking.shop.core.constant.AppSystem;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "微信小程序")
@ApiRest(serviceId = AppSystem.SERVER_APP, value = "/portal/ma/{appNo}")
public class WxPortalController {

    @ApiOperation("GET方式微信认证")
    @GetMapping(produces = "text/plain;charset=utf-8")
    public String authGet(@ApiParam(value = "应用编号", required = true) @PathVariable String appNo,
                          @RequestParam(name = "signature", required = false) String signature,
                          @RequestParam(name = "timestamp", required = false) String timestamp,
                          @RequestParam(name = "nonce", required = false) String nonce,
                          @RequestParam(name = "echostr", required = false) String echostr) {
        log.info("\n接收到来自微信服务器的认证消息：signature = [{}], timestamp = [{}], nonce = [{}], echostr = [{}]",
          signature, timestamp, nonce, echostr);

        if (StringUtils.isAnyBlank(signature, timestamp, nonce, echostr)) {
            throw new IllegalArgumentException("请求参数非法，请核实!");
        }

        final WxMaService wxService = MaConfiguration.getWxMaService(appNo);

        if (wxService.checkSignature(timestamp, nonce, signature)) {
            return echostr;
        }

        return "非法请求";
    }

    @ApiOperation("POST方式微信认证")
    @PostMapping(produces = "application/xml; charset=UTF-8")
    public String post(@ApiParam(value = "应用编号", required = true) @PathVariable String appNo,
                       @RequestBody String requestBody,
                       @RequestParam("msg_signature") String msgSignature,
                       @RequestParam("encrypt_type") String encryptType,
                       @RequestParam("signature") String signature,
                       @RequestParam("timestamp") String timestamp,
                       @RequestParam("nonce") String nonce) {
        log.info("\n接收微信请求：[msg_signature=[{}], encrypt_type=[{}], signature=[{}]," +
            " timestamp=[{}], nonce=[{}], requestBody=[\n{}\n] ",
          msgSignature, encryptType, signature, timestamp, nonce, requestBody);

        final WxMaService wxService = MaConfiguration.getWxMaService(appNo);

        final boolean isJson = Objects.equals(wxService.getWxMaConfig().getMsgDataFormat(),
          WxMaConstants.MsgDataFormat.JSON);
        if (StringUtils.isBlank(encryptType)) {
            // 明文传输的消息
            WxMaMessage inMessage;
            if (isJson) {
                inMessage = WxMaMessage.fromJson(requestBody);
            } else {//xml
                inMessage = WxMaMessage.fromXml(requestBody);
            }

            this.route(inMessage, appNo);
            return "success";
        }

        if ("aes".equals(encryptType)) {
            // 是aes加密的消息
            WxMaMessage inMessage;
            if (isJson) {
                inMessage = WxMaMessage.fromEncryptedJson(requestBody, wxService.getWxMaConfig());
            } else {//xml
                inMessage = WxMaMessage.fromEncryptedXml(requestBody, wxService.getWxMaConfig(),
                  timestamp, nonce, msgSignature);
            }

            this.route(inMessage, appNo);
            return "success";
        }

        throw new RuntimeException("不可识别的加密类型：" + encryptType);
    }

    private void route(WxMaMessage message, String appNo) {
        try {
            MaConfiguration.getWxMaRouters().get(appNo).route(message);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }

}
