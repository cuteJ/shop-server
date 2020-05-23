package com.onlythinking.shop.mgt.system.service.Impl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.onlythinking.shop.core.model.SelectTree;
import com.onlythinking.shop.app.core.utils.PinyinUtils;
import com.onlythinking.shop.mapper.OtRegionMapper;
import com.onlythinking.shop.mgt.system.service.RegionService;
import com.onlythinking.shop.model.OtRegion;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
public class RegionServiceImpl implements RegionService {

    private final OtRegionMapper regionMapper;

    @Override
    public void initRegion(Map<String, String> data, int depth) {
        List<OtRegion> all = regionMapper.getList(new HashMap<>());
        if (CollectionUtils.isNotEmpty(all)) {
            regionMapper.deleteInBatch(all.stream().map(OtRegion::getId).collect(Collectors.toList()));
        }
        if (depth == 1) {
            regionMapper.insertInBatch(
              data.entrySet().stream().map(v -> {
                  OtRegion d = new OtRegion();
                  d.setId(v.getKey());
                  d.setName(v.getValue());
                  d.setDepth(1);
                  d.setDepthName("省");
                  String[] py = PinyinUtils.chineseToPinyinAndJp(v.getValue());
                  d.setJianPin(py[0]);
                  d.setPinYin(py[1]);
                  d.setFirstLetter(StringUtils.substring(py[1], 0, 1));
                  d.setShortName(StringUtils.replaceAll(v.getValue(), "[\\u7701|\\u5e02|\\u81ea\\u6cbb\\u533a|\\u56de\\u65cf|\\u58ee\\u65cf|\\u7279\\u522b\\u884c\\u653f\\u533a]", ""));
                  return d;
              }).collect(Collectors.toList()));
        } else if (depth == 2) {
            regionMapper.insertInBatch(
              data.entrySet().stream().map(v -> {
                  OtRegion d = new OtRegion();
                  d.setId(v.getKey());
                  d.setName(v.getValue());
                  d.setParentId(StringUtils.substring(v.getKey(), 0, 2) + "0000");
                  d.setDepth(2);
                  d.setDepthName("城市");
                  String[] py = PinyinUtils.chineseToPinyinAndJp(v.getValue());
                  d.setJianPin(py[0]);
                  d.setPinYin(py[1]);
                  d.setFirstLetter(StringUtils.substring(py[1], 0, 1));
                  d.setShortName(StringUtils.replaceAll(v.getValue(), "[\\u7701|\\u5e02|\\u81ea\\u6cbb\\u533a|\\u56de\\u65cf|\\u58ee\\u65cf|\\u7279\\u522b\\u884c\\u653f\\u533a]", ""));
                  return d;
              }).collect(Collectors.toList())
            );

        } else if (depth == 3) {
            regionMapper.insertInBatch(
              data.entrySet().stream().map(v -> {
                  OtRegion d = new OtRegion();
                  d.setId(v.getKey());
                  d.setName(v.getValue());
                  d.setParentId(StringUtils.substring(v.getKey(), 0, 4) + "00");
                  d.setDepth(3);
                  d.setDepthName("区县");
                  String[] py = PinyinUtils.chineseToPinyinAndJp(v.getValue());
                  d.setJianPin(py[0]);
                  d.setPinYin(py[1]);
                  d.setFirstLetter(StringUtils.substring(py[1], 0, 1));
                  d.setShortName(v.getValue());
                  return d;
              }).collect(Collectors.toList())
            );
        }
    }

    @Override
    public List<SelectTree> getAll() {
        List<OtRegion> all = regionMapper.getList(new HashMap<>());
        List<OtRegion> provinces = all.stream().filter(v -> v.getDepth() == 1).collect(Collectors.toList());
        List<OtRegion> cities = all.stream().filter(v -> v.getDepth() == 2).collect(Collectors.toList());
        List<OtRegion> counties = all.stream().filter(v -> v.getDepth() == 3).collect(Collectors.toList());
        List<SelectTree> trees = Lists.newArrayList();
        for (OtRegion province : provinces) {
            SelectTree tree = new SelectTree(province.getId(), province.getName());
            tree.setChildren(
              cities.stream().filter(ct -> province.getId().equals(ct.getParentId())).map(v ->
                {
                    SelectTree city = new SelectTree(v.getId(), v.getName());
                    city.setChildren(
                      counties.stream().filter(co -> v.getId().equals(co.getParentId())).map(c -> new SelectTree(c.getId(), c.getName())).collect(Collectors.toList())
                    );
                    return city;
                }
              ).collect(Collectors.toList())
            );
            trees.add(tree);
        }
        return trees;
    }

    @Override
    public List<SelectTree> getByPid(String parentId) {
        return regionMapper.getList(ImmutableMap.of("parentId", parentId)).stream().map(v ->
          new SelectTree(v.getId(), v.getName())
        ).collect(Collectors.toList());
    }

    @Override
    public List<SelectTree> getByDepth(int depth) {
        return regionMapper.getList(ImmutableMap.of("depth", depth)).stream().map(v ->
          new SelectTree(v.getId(), v.getName())
        ).collect(Collectors.toList());
    }

    @Override
    public List<SelectTree> getByDepthShortName(int depth) {
        return regionMapper.getList(ImmutableMap.of("depth", depth)).stream().map(v ->
          new SelectTree(v.getId(), v.getShortName())
        ).collect(Collectors.toList());
    }

    @Override
    public void saveOrUpdateRegion(OtRegion entity) {
        if (StringUtils.isNotBlank(entity.getId())) {
            regionMapper.updateByPK(entity);
        } else {
            entity.setId(entity.getId());
            regionMapper.insert(entity);
        }
    }

    @Override
    public OtRegionMapper getMapper() {
        return regionMapper;
    }
}
