package com.onlythinking.shop.init;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.shop.core.constant.AppSystem;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * <p> 初始化基础数据 </p>
 *
 * @author Li Xingping
 */
@Profile(AppSystem.SPRING_PROFILE_DEV)
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "基础")
@ApiRest(serviceId = AppSystem.SERVER_INSECURE)
public class InitDataController {

    private final InitializerService initializerService;

    @GetMapping("/init/{type}")
    public RespondedBody initData(@PathVariable String type) {
        initializerService.initSingle(type);
        return RespondedBody.successful();
    }

    @GetMapping("/re_init")
    public RespondedBody reInit() {
        initializerService.reInit();
        return RespondedBody.successful();
    }

}
