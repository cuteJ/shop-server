package com.onlythinking.shop.init.initializer;

import com.onlythinking.shop.mgt.system.service.RegionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor
public class RegionInitializer implements Initializer {

    private Initializer next;

    @Override
    public Initializer getNext() {
        return next;
    }

    @Override
    public Initializer buildNext(Initializer next) {
        this.next = next;
        return this.next;
    }

    private final RegionService regionService;

    @Override
    public void before() {
        log.info("开始初始化Region....");
    }

    @Override
    public void process() {

        log.info("初始化Region结束");
    }


}
