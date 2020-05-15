package com.onlythinking.shop.mgt.system.service.Impl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.onlythinking.shop.mapper.OtColumnMetadataMapper;
import com.onlythinking.shop.mapper.OtTableMetadataMapper;
import com.onlythinking.shop.mgt.core.mysql.TableMetaHandler;
import com.onlythinking.shop.mgt.core.mysql.TableMetadataDto;
import com.onlythinking.shop.mgt.system.service.SysMetadataService;
import com.onlythinking.shop.model.OtColumnMetadata;
import com.onlythinking.shop.model.OtTableMetadata;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
public class SysMetadataServiceImpl implements SysMetadataService {
    private final OtTableMetadataMapper tableMetadataMapper;
    private final OtColumnMetadataMapper columnMetadataMapper;
    private final TableMetaHandler tableMetaHandler;

    @Override
    public OtTableMetadataMapper getMapper() {
        return tableMetadataMapper;
    }

    @Override
    @Transactional
    public void sync() {
        List<OtTableMetadata> dbTables = tableMetadataMapper.getList(new HashMap<>());
        List<OtColumnMetadata> dbColumns = columnMetadataMapper.getList(new HashMap<>());
        if (CollectionUtils.isNotEmpty(dbTables)) {
            tableMetadataMapper.deleteInBatch(dbTables.stream().map(OtTableMetadata::getId).collect(Collectors.toList()));
        }
        if (CollectionUtils.isNotEmpty(dbColumns)) {
            columnMetadataMapper.deleteInBatch(dbColumns.stream().map(OtColumnMetadata::getId).collect(Collectors.toList()));
        }

        List<TableMetadataDto> tableMetadata = tableMetaHandler.generateTableMetadata();

        List<OtTableMetadata> tables = Lists.newArrayList();
        List<OtColumnMetadata> columns = Lists.newArrayList();

        for (TableMetadataDto v : tableMetadata) {
            OtTableMetadata entity = new OtTableMetadata();
            BeanUtils.copyProperties(v, entity);
            tables.add(entity);
            for (OtColumnMetadata vv : v.getColumns()) {
                OtColumnMetadata colEntity = new OtColumnMetadata();
                BeanUtils.copyProperties(vv, colEntity);
                columns.add(colEntity);
            }
        }
        tableMetadataMapper.insertInBatch(tables);
        columnMetadataMapper.insertInBatch(columns);
    }

    @Override
    public TableMetadataDto getDetail(String id) {
        OtTableMetadata tableMetadata = tableMetadataMapper.getByPK(id);
        TableMetadataDto dto = new TableMetadataDto();
        BeanUtils.copyProperties(tableMetadata, dto);
        dto.setColumns(columnMetadataMapper.getList(ImmutableMap.of("tableId", tableMetadata.getId())));
        return dto;
    }
}
