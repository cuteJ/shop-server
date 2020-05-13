package com.onlythinking.shop.app.insecure.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.shop.core.constant.AppSystem;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@Api(tags = "测试")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@ApiRest(serviceId = AppSystem.SERVER_APP, value = AppSystem.SERVER_INSECURE)
public class InsecureController {
}
