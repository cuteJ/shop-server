package com.onlythinking.shop.mgt.system.service;


import com.onlythinking.shop.core.service.OtBasicService;
import com.onlythinking.shop.mapper.OtTableMetadataMapper;
import com.onlythinking.shop.mgt.core.mysql.TableMetadataDto;
import com.onlythinking.shop.model.OtTableMetadata;

public interface SysMetadataService extends OtBasicService<OtTableMetadata, OtTableMetadataMapper> {

    void sync();

    TableMetadataDto getDetail(String id);
}

