package com.onlythinking.shop.core.helper;

import com.onlythinking.shop.core.model.ThirdResponseBody;
import okhttp3.OkHttpClient;

import java.io.File;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface ThirdHttpClient {

    /**
     * <p>获取OkHttpClient</p>
     *
     * @return OkHttpClient
     */
    OkHttpClient httpClient();

    /**
     * <p>执行 application/json 提交</p>
     *
     * @param url           地址
     * @param requestParams 请求参数
     * @param headers       自定义头
     * @return t 响应类型
     */
    <T> T executeGetJson(String url, Map<String, String> requestParams, Map<String, String> headers, Class<T> responseType);

    /**
     * <p>执行 application/json 提交</p>
     *
     * @param url           地址
     * @param requestParams 请求参数
     * @return t 响应类型
     */
    <T> T executeGetJson(String url, Map<String, String> requestParams, Class<T> responseType);


    /**
     * <p>执行 application/json 提交</p>
     *
     * @param url           地址
     * @param requestParams 请求参数
     * @return t 响应类型
     */
    String executeGetJsonAsString(String url, Map<String, String> requestParams);

    /**
     * <p>执行 application/json 提交</p>
     *
     * @param url           地址
     * @param requestParams 请求参数
     * @param headers       自定义头
     * @return t 响应类型
     */
    String executeGetJsonAsString(String url, Map<String, String> requestParams, Map<String, String> headers);


    /**
     * <p>执行 application/json 提交</p>
     *
     * @param url         地址
     * @param requestBody 请求参数
     * @return t 响应类型
     */
    <T> T executePostJson(String url, Object requestBody, Class<T> responseType);


    /**
     * <p>执行 application/json 提交</p>
     *
     * @param url         地址
     * @param requestBody 请求参数
     * @param headers     自定义头
     * @return t 响应类型
     */
    <T> T executePostJson(String url, Object requestBody, Class<T> responseType, Map<String, String> headers);

    /**
     * <p>执行 application/json 提交</p>
     *
     * @param url         地址
     * @param requestBody 请求参数
     * @return string json
     */
    String executePostJsonAsString(String url, Object requestBody);

    /**
     * <p>执行 application/json 提交</p>
     *
     * @param url         地址
     * @param requestBody 请求参数
     * @param headers     自定义头
     * @return ThirdResponseBody 响应
     */
    ThirdResponseBody executePostJson(String url, Object requestBody, Map<String, String> headers);

    /**
     * <p>执行 application/json 提交</p>
     *
     * @param url         地址
     * @param requestBody 请求参数
     * @return ThirdResponseBody 响应
     */
    ThirdResponseBody executePostJson(String url, Object requestBody);

    /**
     * <p>执行 application/x-www-form-urlencoded 提交</p>
     *
     * @param url           地址
     * @param requestParams 请求参数
     * @param headers       自定义头
     * @return ThirdResponseBody 响应
     */
    <T> T executePostForm(String url, Map<String, String> requestParams, Map<String, String> headers, Class<T> responseType);


    /**
     * <p>执行 application/x-www-form-urlencoded 提交</p>
     *
     * @param url           地址
     * @param requestParams 请求参数
     * @return ThirdResponseBody 响应
     */
    <T> T executePostForm(String url, Map<String, String> requestParams, Class<T> responseType);


    /**
     * <p>执行 application/x-www-form-urlencoded 提交</p>
     *
     * @param url           地址
     * @param requestParams 请求参数
     * @return String json
     */
    String executePostFormAsString(String url, Map<String, String> requestParams);

    /**
     * <p>执行 application/x-www-form-urlencoded 提交</p>
     *
     * @param url           地址
     * @param requestParams 请求参数
     * @return ThirdResponseBody 响应
     */
    ThirdResponseBody executePostForm(String url, Map<String, String> requestParams);

    /**
     * <p>执行 multipart/form-data 提交</p>
     *
     * @param url           地址
     * @param file          文件
     * @param requestParams 请求参数
     * @return ThirdResponseBody 响应
     */
    ThirdResponseBody executeMultipart(String url, File file, Map<String, String> requestParams);

}
