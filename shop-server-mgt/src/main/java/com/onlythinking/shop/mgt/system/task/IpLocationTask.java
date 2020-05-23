package com.onlythinking.shop.mgt.system.task;

import com.alibaba.fastjson.JSON;
import com.onlythinking.shop.core.helper.ThirdHttpClient;
import com.onlythinking.shop.core.utils.IpAddress;
import com.onlythinking.shop.mgt.system.dto.IpLog;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

/**
 * <p> IP位置查询 </p>
 *
 * @author Li Xingping
 */
public class IpLocationTask implements Callable<List<IpLog>> {

    private final List<String> ips;

    private final ThirdHttpClient httpClient;


    public IpLocationTask(List<String> ips, ThirdHttpClient httpClient) {
        this.ips = ips;
        this.httpClient = httpClient;
    }

    @Override
    public List<IpLog> call() throws Exception {
        List<IpLog> ipResult = new ArrayList<>();
        for (String ip : ips) {

            String result = httpClient.executeGetJsonAsString(IpAddress.URL_IPAPI.replace("{ip}", ip), null);
            Map<?, ?> jsonResult = JSON.parseObject(result, Map.class);

            String country = (String) jsonResult.get("country");
            String province = (String) jsonResult.get("regionName");
            String city = (String) jsonResult.get("city");

            IpLog dto = new IpLog();
            dto.setIp(ip);
            dto.setCountry(country);
            dto.setProvince(province);
            dto.setCity(city);

            ipResult.add(dto);
        }
        return ipResult;
    }
}
