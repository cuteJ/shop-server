package com.onlythinking.shop.core.helper;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlythinking.commons.exception.GlobalErrorCode;
import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.shop.core.exception.CoreErrorCode;
import com.onlythinking.shop.core.model.ThirdResponseBody;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import okhttp3.logging.HttpLoggingInterceptor;
import okio.GzipSource;
import okio.Okio;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.util.CollectionUtils;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
public class ThirdHttpClientImpl implements ThirdHttpClient, InitializingBean {

    @Setter
    private OkHttpClient client;
    @Setter
    private ObjectMapper objectMapper;

    @Override
    public void afterPropertiesSet() throws Exception {
        if (null == client) {
            client = new OkHttpClient.Builder()
              .addInterceptor(
                new HttpLoggingInterceptor().setLevel(HttpLoggingInterceptor.Level.BODY)
              )
              .connectionPool(new ConnectionPool())
              .connectTimeout(10, TimeUnit.SECONDS)
              .readTimeout(10, TimeUnit.SECONDS)
              .writeTimeout(10, TimeUnit.SECONDS)
              .retryOnConnectionFailure(true)
              .build();
        }
        if (null == objectMapper) {
            objectMapper = new ObjectMapper();
        }
    }

    @Override
    public OkHttpClient httpClient() {
        return this.client;
    }

    @Override
    public <T> T executeGetJson(String url, Map<String, String> requestParams, Map<String, String> headers, Class<T> responseType) {
        return handleResponse(doGetExecute(url, requestParams, headers), responseType);
    }

    @Override
    public <T> T executeGetJson(String url, Map<String, String> requestParams, Class<T> responseType) {
        return this.executeGetJson(url, requestParams, null, responseType);
    }

    @Override
    public String executeGetJsonAsString(String url, Map<String, String> requestParams) {
        return this.executeGetJsonAsString(url, requestParams, null);
    }

    @Override
    public String executeGetJsonAsString(String url, Map<String, String> requestParams, Map<String, String> headers) {
        return doGetExecute(url, requestParams, headers);
    }

    @Override
    public <T> T executePostJson(String url, Object requestBody, Class<T> responseType) {
        return this.handleResponse(this.doPostExecute(url, createJsonBody(requestBody), null), responseType);
    }

    @Override
    public <T> T executePostJson(String url, Object requestBody, Class<T> responseType, Map<String, String> headers) {
        return handleResponse(doPostExecute(url, createJsonBody(requestBody), headers), responseType);
    }

    @Override
    public String executePostJsonAsString(String url, Object requestBody) {
        return doPostExecute(url, createJsonBody(requestBody), null);
    }

    @Override
    public ThirdResponseBody executePostJson(String url, Object requestBody, Map<String, String> headers) {
        return doPostExecuteDefault(url, createJsonBody(requestBody), headers);
    }

    @Override
    public ThirdResponseBody executePostJson(String url, Object requestBody) {
        return doPostExecuteDefault(url, createJsonBody(requestBody), null);
    }

    @Override
    public <T> T executePostForm(String url, Map<String, String> requestParams, Map<String, String> headers, Class<T> responseType) {
        FormBody.Builder builder = new FormBody.Builder();
        for (Map.Entry<String, String> entry : requestParams.entrySet()) {
            builder.add(entry.getKey(), entry.getValue());
        }
        return handleResponse(doPostExecute(url, builder.build(), headers), responseType);
    }

    @Override
    public <T> T executePostForm(String url, Map<String, String> requestParams, Class<T> responseType) {
        return this.executePostForm(url, requestParams, null, responseType);
    }

    @Override
    public String executePostFormAsString(String url, Map<String, String> requestParams) {
        FormBody.Builder builder = new FormBody.Builder();
        for (Map.Entry<String, String> entry : requestParams.entrySet()) {
            builder.add(entry.getKey(), entry.getValue());
        }
        return doPostExecute(url, builder.build(), null);
    }

    @Override
    public ThirdResponseBody executePostForm(String url, Map<String, String> requestParams) {
        FormBody.Builder builder = new FormBody.Builder();
        for (Map.Entry<String, String> entry : requestParams.entrySet()) {
            builder.add(entry.getKey(), entry.getValue());
        }
        return doPostExecuteDefault(url, builder.build(), null);
    }

    @Override
    public ThirdResponseBody executeMultipart(String url, File file, Map<String, String> requestParams) {
        MultipartBody.Builder builder = new MultipartBody.Builder();
        builder.setType(MultipartBody.FORM);

        for (Map.Entry<String, String> entry : requestParams.entrySet()) {
            builder.addFormDataPart(entry.getKey(), entry.getValue());
        }

        builder.addPart(
          Headers.of("Content-Disposition", "form-data; name=\"file\";filename=\"" + file.getName() + "\""),
          RequestBody.create(null, file)
        );
        return doPostExecuteDefault(url, builder.build(), null);
    }

    private String doGetExecute(String url, Map<String, String> requestParams, Map<String, String> headers) {

        HttpUrl.Builder urlBuilder = HttpUrl.parse(url).newBuilder();

        if (!CollectionUtils.isEmpty(requestParams)) {
            for (Map.Entry<String, String> entry : requestParams.entrySet()) {
                urlBuilder.addQueryParameter(entry.getKey(), entry.getValue());
            }
        }
        try {
            Request.Builder builder = new Request.Builder();

            // 添加自定义头
            if (!CollectionUtils.isEmpty(headers)) {
                for (Map.Entry<String, String> entry : headers.entrySet()) {
                    builder.header(entry.getKey(), entry.getValue());
                }
            }

            Request request = builder
              .url(urlBuilder.build())
              .get()
              .build();
            Response response;
            response = client.newCall(request).execute();

            // 处理 gzip 暂只支持 gzip
            String bodyData = decodeBody(response);

            if (!response.isSuccessful()) {
                throw new RespondedException(CoreErrorCode.THIRD_HTTP_CLIENT_ERROR, String.format("Request [%s] code[ %s ] message: [%s]", url, response.code(), bodyData));
            }
            return bodyData;
        } catch (IOException e) {
            log.error("Request {} error: {}", url, e);
            throw new RespondedException(CoreErrorCode.THIRD_HTTP_CLIENT_IO_ERROR, e.toString());
        }
    }

    private String doPostExecute(String url, RequestBody body, Map<String, String> headers) {

        Request.Builder builder = new Request.Builder();

        // 添加自定义头
        if (!CollectionUtils.isEmpty(headers)) {
            for (Map.Entry<String, String> entry : headers.entrySet()) {
                builder.header(entry.getKey(), entry.getValue());
            }
        }

        Request request = builder
          .url(url)
          .post(body)
          .build();
        Response response;
        try {
            response = client.newCall(request).execute();

            // 处理 gzip 暂只支持 gzip
            String bodyData = decodeBody(response);

            if (!response.isSuccessful()) {
                throw new RespondedException(CoreErrorCode.THIRD_HTTP_CLIENT_ERROR, String.format("Request [%s] code[ %s ] message: [%s]", url, response.code(), bodyData));
            }
            return bodyData;
        } catch (IOException e) {
            log.error("Request {} error: {}", url, e);
            throw new RespondedException(CoreErrorCode.THIRD_HTTP_CLIENT_IO_ERROR, e.toString());
        }
    }

    private ThirdResponseBody doPostExecuteDefault(String url, RequestBody body, Map<String, String> headers) {

        Request.Builder builder = new Request.Builder();

        // 添加自定义头
        if (!CollectionUtils.isEmpty(headers)) {
            for (Map.Entry<String, String> entry : headers.entrySet()) {
                builder.header(entry.getKey(), entry.getValue());
            }
        }

        Request request = builder
          .url(url)
          .post(body)
          .build();
        Response response;
        try {
            response = client.newCall(request).execute();

            // 处理 gzip 暂只支持 gzip
            String bodyData = decodeBody(response);

            if (!response.isSuccessful()) {
                return new ThirdResponseBody(response.code(), String.format("Request [%s] code[ %s ] message: [%s]", url, response.code(), bodyData), null);
            }
            return new ThirdResponseBody(GlobalErrorCode.SUCCESSFUL, "ok", bodyData);
        } catch (IOException e) {
            log.error("Request {} error: {}", url, e);
            throw new RespondedException(CoreErrorCode.THIRD_HTTP_CLIENT_IO_ERROR, e.toString());
        }
    }

    private RequestBody createJsonBody(Object requestBody) {
        String body;
        if (requestBody instanceof String) {
            body = (String) requestBody;
        } else {
            try {
                body = objectMapper.writeValueAsString(requestBody);
            } catch (JsonProcessingException e) {
                log.error(e.toString());
                throw new RespondedException(GlobalErrorCode.UNDEFINED, e.toString());
            }
        }
        return RequestBody.create(MediaType.parse(
          org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE),
          body);
    }

    private <T> T handleResponse(String result, Class<T> responseType) {
        try {
            return objectMapper.readValue(result, responseType);
        } catch (IOException e) {
            log.error(e.toString());
            throw new RespondedException(GlobalErrorCode.UNDEFINED, e.toString());
        }
    }

    private String decodeBody(Response response) throws IOException {
        final ResponseBody body = response.body();
        if (body == null) return null;

        if (isZipped(response)) {
            return unzip(response.body());
        } else {
            return body.string();
        }
    }

    private boolean isZipped(Response response) {
        return "gzip".equalsIgnoreCase(response.header("Content-Encoding"));
    }

    private String unzip(ResponseBody body) {
        try {
            GzipSource responseBody = new GzipSource(body.source());
            return Okio.buffer(responseBody).readUtf8();
        } catch (IOException e) {
            return null;
        }
    }
}
