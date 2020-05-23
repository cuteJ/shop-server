package com.onlythinking.shop.core.utils;

import com.alibaba.fastjson.JSON;
import com.onlythinking.shop.core.helper.ThirdHttpClient;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
public class IpAddress {
    /**
     * 多线程公共变量，key=ip,value=address
     */
    public static final Map<String, String> ipAddressMap = new HashMap<String, String>();

    /**
     * https://ip-api.com
     */
    public static final String URL_IPAPI = "http://ip-api.com/json/{ip}?lang=zh-CN";

    /**
     * 太平洋ip地址查询接口
     */
    public static final String URL_PCONLINE = "http://whois.pconline.com.cn/ipJson.jsp?ip={ip}&timeStamp={timeStamp}";

    /**
     * 淘宝ip地址查询接口(有频率限制经常超时)
     */
    public static final String URL_TB = "http://ip.taobao.com/service/getIpInfo.php?ip={ip}&timeStamp={timeStamp}";

    /**
     * 百度ip地址查询接口
     */
    public static final String URL_BD = "http://opendata.baidu.com/api.php?resource_id=6006&format=json&query={ip}&timeStamp={timeStamp}";

    private final ThirdHttpClient httpClient;

    public IpAddress(ThirdHttpClient httpClient) {
        this.httpClient = httpClient;
    }

    public String getAddresses(String ip) {
        ipAddressMap.remove(ip);
        ExecutorService pool = Executors.newFixedThreadPool(2);
        Long begin = System.currentTimeMillis();
        String timeStamp = String.valueOf(begin);
        pool.execute(new AddressBD(ip, timeStamp));
        pool.execute(new AddressIPApi(ip, timeStamp));
        while (null == ipAddressMap.get(ip) && System.currentTimeMillis() - begin < 3000) {
            try {
                Thread.sleep(50);
            } catch (InterruptedException e) {
                return null;
            }
        }
        pool.shutdownNow();
        return ipAddressMap.get(ip);
    }

    public class AddressIPApi implements Runnable {
        private String ip;
        private String timeStamp;
        String address;
        String country;// 国家

        String province; // 省
        String city; // 市
        String county; // 县区

        AddressIPApi(String ip, String timeStamp) {
            this.ip = ip;
            this.timeStamp = timeStamp;
        }

        @Override
        public void run() {
            try {
                String result = httpClient.executeGetJsonAsString(URL_IPAPI.replace("{ip}", ip), null);
                Map<?, ?> jsonResult = JSON.parseObject(result, Map.class);
                if (StringUtils.isNotBlank(ipAddressMap.get(ip))) {
                    return;
                }
                country = (String) jsonResult.get("country");
                province = (String) jsonResult.get("regionName");
                city = (String) jsonResult.get("city");
                address = city;
                address = (String) jsonResult.get("region");
                ipAddressMap.put(ip, address);
            } catch (Exception e) {
                // ignore
            }
        }
    }

    public class AddressTB implements Runnable {
        private String ip;
        private String timeStamp;
        String address;
        String country;// 国家

        String province; // 省
        String city; // 市
        String county; // 县区

        AddressTB(String ip, String timeStamp) {
            this.ip = ip;
            this.timeStamp = timeStamp;
        }

        @Override
        public void run() {
            try {
                String result = httpClient.executeGetJsonAsString(URL_TB.replace("{ip}", ip).replace("{timeStamp}", timeStamp), null);
                result = result.substring(17, result.length() - 1);
                Map<?, ?> jsonResult = JSON.parseObject(result, Map.class);
                if (StringUtils.isNotBlank(ipAddressMap.get(ip))) {
                    return;
                }
                address = (String) jsonResult.get("county");
                if (StringUtils.isNotEmpty(address)) {
                    ipAddressMap.put(ip, address);
                    return;
                }
                address = (String) jsonResult.get("city");
                if (StringUtils.isNotEmpty(address)) {
                    ipAddressMap.put(ip, address);
                    return;
                }
                address = (String) jsonResult.get("region");
                ipAddressMap.put(ip, address);
            } catch (Exception e) {
                // ignore
            }
        }
    }

    public class AddressBD implements Runnable {
        private String ip;
        private String timeStamp;
        String address;

        String country;// 国家

        String province; // 省
        String city; // 市
        String county; // 县区

        AddressBD(String ip, String timeStamp) {
            this.ip = ip;
            this.timeStamp = timeStamp;
        }

        @Override
        public void run() {
            try {
                String result = httpClient.executeGetJsonAsString(URL_BD.replace("{ip}", ip).replace("{timeStamp}", timeStamp), null);
                result = result.substring(49, result.length() - 2);
                Map<?, ?> jsonResult = JSON.parseObject(result, Map.class);
                if (StringUtils.isNotBlank(ipAddressMap.get(ip))) {
                    return;
                }
                address = (String) jsonResult.get("location");
                if (address.indexOf(" ") > 0) {
                    address = address.substring(0, address.indexOf(" "));
                }
                if (address.indexOf("省") + 1 == address.length()) {
                    ipAddressMap.put(ip, address);
                    return;
                }
                if (address.indexOf("市") + 1 == address.length()) {
                    address = address.substring(address.indexOf("省") + 1);
                    ipAddressMap.put(ip, address);
                    return;
                }
                address = address.substring(address.indexOf("市") + 1, address.length());
                ipAddressMap.put(ip, address);
            } catch (Exception e) {
                // ignore
            }
        }
    }
}
