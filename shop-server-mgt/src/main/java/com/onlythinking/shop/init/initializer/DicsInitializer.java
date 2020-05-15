package com.onlythinking.shop.init.initializer;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.onlythinking.shop.mapper.OtSysDicMapper;
import com.onlythinking.shop.mapper.OtSysTypeDicMapper;
import com.onlythinking.shop.model.OtSysDic;
import com.onlythinking.shop.model.OtSysTypeDic;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.google.common.collect.Lists.newArrayList;
import static com.onlythinking.shop.core.constant.DicConstant.*;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor
public class DicsInitializer implements Initializer {

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

    private final OtSysTypeDicMapper sysTypeDicMapper;
    private final OtSysDicMapper sysDicMapper;

    private static Map<String, List<DicDto>> DIC_MAP = Maps.newHashMap();
    private static Map<String, String> TYPES_MAP = Maps.newHashMap();

    static {
        DIC_MAP.put(TYPE_1000, newArrayList(new DicDto("是", VAL_1000_00), new DicDto("否", VAL_1000_01)));
        DIC_MAP.put(TYPE_1001, newArrayList(new DicDto("男", VAL_1001_00), new DicDto("女", VAL_1001_01), new DicDto("未知", VAL_1001_02)));
        DIC_MAP.put(TYPE_1002, newArrayList(new DicDto("固定频率", VAL_1002_00), new DicDto("每日时间段", VAL_1002_01), new DicDto("CRON", VAL_1002_02)));
        DIC_MAP.put(TYPE_1003, newArrayList(new DicDto("运行中", VAL_1003_00), new DicDto("暂停", VAL_1003_01), new DicDto("失败", VAL_1003_02)));
        DIC_MAP.put(TYPE_1004, newArrayList(new DicDto("成功", VAL_1004_00), new DicDto("失败", VAL_1004_01)));
        DIC_MAP.put(TYPE_1005, newArrayList(new DicDto("微信", VAL_1005_00), new DicDto("用户名", VAL_1005_01)));

        TYPES_MAP.put(TYPE_1000, "是否");
        TYPES_MAP.put(TYPE_1001, "性别");
        TYPES_MAP.put(TYPE_1002, "触发器类型");
        TYPES_MAP.put(TYPE_1003, "实例状态");
        TYPES_MAP.put(TYPE_1004, "运行状态");
    }

    @Override
    public void before() {
        log.info("开始初始化Dics....");
        List<OtSysDic> dics = newArrayList();
        List<OtSysTypeDic> typeDics = newArrayList();
        List<String> types = new ArrayList<>(TYPES_MAP.keySet());
        for (String type : types) {
            dics.addAll(sysDicMapper.getList(ImmutableMap.of("typeCode", type)));
        }
        for (String type : types) {
            typeDics.addAll(sysTypeDicMapper.getList(ImmutableMap.of("typeCode", type)));
        }
        if (CollectionUtils.isNotEmpty(dics)) {
            sysDicMapper.deleteInBatch(dics.stream().map(OtSysDic::getId).collect(Collectors.toList()));
        }
        if (CollectionUtils.isNotEmpty(dics)) {
            sysTypeDicMapper.deleteInBatch(typeDics.stream().map(OtSysTypeDic::getId).collect(Collectors.toList()));
        }
    }

    @Override
    public void process() {
        for (Map.Entry<String, String> entry : TYPES_MAP.entrySet()) {
            OtSysTypeDic dto = new OtSysTypeDic();
            dto.setTypeCode(entry.getKey());
            dto.setTypeName(entry.getValue());
            dto.setStatus(VAL_1000_00);
            sysTypeDicMapper.insert(dto);
        }

        for (Map.Entry<String, List<DicDto>> entry : DIC_MAP.entrySet()) {
            for (DicDto dic : entry.getValue()) {
                OtSysDic val = new OtSysDic();
                val.setTypeCode(entry.getKey());
                val.setValCode(dic.getValCode());
                val.setValName(dic.getValName());
                val.setStatus(VAL_1000_00);
                sysDicMapper.insert(val);
            }
        }

        log.info("初始化Dics结束");
    }

    @AllArgsConstructor
    @Data
    public static class DicDto {
        private String valName;
        private String valCode;
    }
}
