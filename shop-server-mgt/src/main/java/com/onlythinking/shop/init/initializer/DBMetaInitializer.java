package com.onlythinking.shop.init.initializer;

import com.onlythinking.shop.mgt.system.service.SysMetadataService;
import com.onlythinking.shop.model.OtColumnMetadata;
import com.onlythinking.shop.model.OtTableMetadata;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor
public class DBMetaInitializer implements Initializer {

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

    private final SysMetadataService sysMetadataService;

    @Override
    public void before() {
        log.info("开始初始化DBMeta....");
    }

    @Override
    public void process() {
        sysMetadataService.sync();
        log.info("初始化DBMeta结束");
    }

}
