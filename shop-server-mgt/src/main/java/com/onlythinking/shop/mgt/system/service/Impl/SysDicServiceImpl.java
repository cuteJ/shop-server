package com.onlythinking.shop.mgt.system.service.Impl;

import com.google.common.collect.ImmutableMap;
import com.onlythinking.shop.mapper.OtSysDicMapper;
import com.onlythinking.shop.mapper.OtSysTypeDicMapper;
import com.onlythinking.shop.mgt.system.mapper.OtSysSystemMapper;
import com.onlythinking.shop.mgt.system.service.SysDicService;
import com.onlythinking.shop.model.OtSysDic;
import com.onlythinking.shop.model.OtSysTypeDic;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
@Transactional
public class SysDicServiceImpl implements SysDicService {
    private final OtSysDicMapper sysDicMapper;
    private final OtSysTypeDicMapper sysTypeDicMapper;
    private final OtSysSystemMapper sysSystemMapper;

    @Override
    @Transactional(readOnly = true)
    public Map<String, Object> getDictionaries(String typeCode) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("typeCode", typeCode);
        List<OtSysDic> codeList = sysDicMapper.getList(map);
        Map<String, Object> type = new HashMap<String, Object>();
        type.put("__default__", codeList);
        return type;
    }

    @Override
    @Transactional(readOnly = true)
    public Map<String, Object> getDictionaries(List<String> typeCodes) {
        Map<String, Object> map = new HashMap<String, Object>();
        for (String typeCode : typeCodes) {
            map.put(typeCode, this.getDictionaries(typeCode));
        }
        return map;
    }

    @Override
    @Transactional(readOnly = true)
    public List<OtSysTypeDic> getSysTypeDicList(Map<String, Object> params) {
        return sysTypeDicMapper.getList(params);
    }

    @Override
    public void saveOrUpdateSysTypeDic(OtSysTypeDic entity) {
        if (StringUtils.isNotBlank(entity.getId())) {
            sysTypeDicMapper.updateByPK(entity);
        } else {
            entity.setId(entity.getTypeCode());
            sysTypeDicMapper.insert(entity);
        }
    }

    @Override
    public void removeSysTypeDic(String id) {
        List<OtSysDic> otSysDics = sysDicMapper.getList(ImmutableMap.of("typeCode", id));
        if (CollectionUtils.isNotEmpty(otSysDics)) {
            sysDicMapper.deleteInBatch(otSysDics.stream().map(OtSysDic::getId).collect(Collectors.toList()));
        }
        sysTypeDicMapper.deleteByPK(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<OtSysDic> getSysDicList(Map<String, Object> params) {
        return sysDicMapper.getList(params);
    }

    @Override
    public void saveOrUpdateSysDic(OtSysDic entity) {
        if (StringUtils.isNotBlank(entity.getId())) {
            sysDicMapper.updateByPK(entity);
        } else {
            sysDicMapper.insert(entity);
        }
    }

    @Override
    public void removeSysDic(String id) {
        sysDicMapper.deleteByPK(id);
    }

    @Override
    public String getLastTypeDicCode() {
        String last = sysSystemMapper.getLastTypeDicCode();
        if (StringUtils.isBlank(last)) {
            return null;
        }
        return String.valueOf(Long.parseLong(last) + 1L);
    }

    @Override
    public String getLastDicCode(String typeCode) {
        String last = sysSystemMapper.getLastDicCode(typeCode);
        if (StringUtils.isBlank(last)) {
            return null;
        }
        return String.valueOf(Long.parseLong(last) + 1L);
    }
}
