package com.onlythinking.shop.mgt.system.web;

import com.google.common.collect.Lists;
import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.shop.app.core.utils.OtOssClient;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.exception.CoreErrorCode;
import com.onlythinking.shop.core.helper.ThirdHttpClient;
import com.onlythinking.shop.core.model.SelectTree;
import com.onlythinking.shop.mapper.OtSysOptLogMapper;
import com.onlythinking.shop.mgt.system.dto.IpLog;
import com.onlythinking.shop.mgt.system.dto.UserCount;
import com.onlythinking.shop.mgt.system.service.RegionService;
import com.onlythinking.shop.mgt.system.task.IpLocationTask;
import com.onlythinking.shop.model.OtSysOptLog;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "图表统计")
@ApiRest(serviceId = AppSystem.SERVER_SYS, value = "/charts")
public class ChartsController {

    private static final String CHART_GEO = "https://geo.datav.aliyun.com/areas_v2/bound/%s.json";

    private final ThirdHttpClient httpClient;
    private final OtOssClient ossClient;
    private final RegionService regionService;

    /**
     * 规范查看：https://geojson.org/
     *
     * @param code 地区编码 OtRegion
     */
    @ApiOperation("获取图表GEO")
    @GetMapping(value = "/proxy/geo")
    public String proxyGeoData(@RequestParam String code) {
        return httpClient.executeGetJsonAsString(String.format(CHART_GEO, code), null);
    }

    @ApiOperation("转存到本地文件")
    @PostMapping(value = "/cache/local/geo")
    public RespondedBody cacheGeoData(@RequestParam String base) throws IOException {

        List<SelectTree> trees = regionService.getAll();

        trees.add(new SelectTree("100000", "全国"));

        File baseFile = new File(base);

        // 删除之前数据
        if (baseFile.exists()) {
            FileUtils.cleanDirectory(baseFile);
        } else {
            FileUtils.forceMkdir(baseFile);
        }

        List<String> nones = Lists.newArrayList();

        for (SelectTree province : trees) {
            List<SelectTree> cityList = province.getChildren();

            String provinceStr = getData(province.getValue());

            if (StringUtils.isBlank(provinceStr)) {
                nones.add(province.getLabel());
                continue;
            }

            IOUtils.write(provinceStr, new FileOutputStream(new File(base + "/" + province.getValue() + ".json")), StandardCharsets.UTF_8);

            String provinceStrFull = getData(province.getValue() + "_full");

            if (StringUtils.isBlank(provinceStrFull)) {
                nones.add(province.getLabel() + "_full");
                continue;
            }

            IOUtils.write(provinceStrFull, new FileOutputStream(new File(base + "/" + province.getValue() + "_full" + ".json")), StandardCharsets.UTF_8);

            if (CollectionUtils.isNotEmpty(cityList)) {

                for (SelectTree city : cityList) {

                    String cityStr = getData(city.getValue());

                    if (StringUtils.isBlank(cityStr)) {
                        nones.add(city.getLabel());
                        continue;
                    }

                    IOUtils.write(cityStr, new FileOutputStream(new File(base + "/" + city.getValue() + ".json")), StandardCharsets.UTF_8);

                    String cityStrFull = getData(city.getValue() + "_full");
                    if (StringUtils.isBlank(cityStrFull)) {
                        nones.add(city.getLabel() + "_full");
                        continue;
                    }

                    IOUtils.write(cityStrFull, new FileOutputStream(new File(base + "/" + city.getValue() + "_full" + ".json")), StandardCharsets.UTF_8);

                    List<SelectTree> countyList = city.getChildren();

                    if (CollectionUtils.isNotEmpty(countyList)) {

                        for (SelectTree county : countyList) {
                            String countyStr = getData(county.getValue());

                            if (StringUtils.isBlank(countyStr)) {
                                nones.add(county.getLabel());
                                continue;
                            }

                            IOUtils.write(countyStr, new FileOutputStream(new File(base + "/" + county.getValue() + ".json")), StandardCharsets.UTF_8);
                        }
                    }
                }
            }

        }

        if (CollectionUtils.isNotEmpty(nones)) {
            log.warn("找不到以下地区文件 {}", nones);
        }
        return RespondedBody.successful("找不到以下地区文件" + Arrays.toString(nones.toArray()));
    }

    private final ExecutorService ip = Executors.newFixedThreadPool(2);

    @ApiOperation("用户分布画像数据")
    @PostMapping(value = "/user/count")
    public List<UserCount> randomUserCount() {
        Map<String, Long> provinceMap = regionService.getByDepthShortName(1).stream()
          .map(SelectTree::getLabel)
          .collect(Collectors.toMap(v -> v, (v) -> 0L));
        List<UserCount> ipResult = Lists.newArrayList();

        for (String key : provinceMap.keySet()) {
            UserCount item = new UserCount();
            item.setName(key);
            item.setValue(RandomUtils.nextInt(0, 100));
            ipResult.add(item);
        }
        return ipResult;
    }

    @ApiOperation("IP分布解析")
    @PostMapping(value = "/ip/dis")
    public List<IpLog> ipDistributed(@RequestBody List<IpLog> dto) throws InterruptedException, ExecutionException, TimeoutException {

        if (dto.size() > 50) {
            throw RespondedException.argumentInvalid("系统仅用于测试学习，请输入低于50条IP");
        }

        List<IpLog> ipLogs = ip.submit(new IpLocationTask(
          dto.stream().map(v -> v.getIp().trim()).collect(Collectors.toList()), httpClient)
        ).get(60, TimeUnit.SECONDS);

        Map<String, Long> provinceMap = regionService.getByDepthShortName(1).stream()
          .map(SelectTree::getLabel)
          .collect(Collectors.toMap(v -> v, (v) -> 0L));
        provinceMap.put("未知", 0L);

        List<IpLog> ipResult = Lists.newArrayList();

        if (CollectionUtils.isNotEmpty(ipLogs)) {
            Set<String> provinceLabel = provinceMap.keySet();
            for (IpLog ip : ipLogs) {
                if (!"中国".equalsIgnoreCase(ip.getCountry())) {
                    provinceMap.put("海外", provinceMap.get("海外") + 1L);
                } else {
                    String proKey = getProvince(provinceLabel, ip.getProvince());
                    provinceMap.put(proKey, provinceMap.get(proKey) + 1);
                }
            }
        }

        for (String key : provinceMap.keySet()) {
            IpLog item = new IpLog();
            item.setName(key);
            item.setValue(provinceMap.get(key));
            ipResult.add(item);
        }

        return ipResult;
    }

    private final OtSysOptLogMapper sysOptLogMapper;

    @GetMapping(value = "/logs")
    public String userLogs() {
        return StringUtils.joinWith(
          ",",
          sysOptLogMapper.getList(new HashMap<>()).stream().map(OtSysOptLog::getOptIp).collect(Collectors.toList())
        );
    }

    private String getProvince(Set<String> provinceLabel, String ipPro) {
        for (String pro : provinceLabel) {
            if (pro.contains(ipPro)) {
                return pro;
            }
        }
        return "未知";
    }

    private String getData(String code) {
        try {
            return httpClient.executeGetJsonAsString(String.format(CHART_GEO, code), null);
        } catch (RespondedException e) {
            if (CoreErrorCode.THIRD_HTTP_CLIENT_ERROR == e.getErrorCode()
              || CoreErrorCode.THIRD_HTTP_CLIENT_IO_ERROR == e.getErrorCode()) {
                log.warn("No found {} ", code);
                return null;
            }
            throw e;
        }
    }

}
