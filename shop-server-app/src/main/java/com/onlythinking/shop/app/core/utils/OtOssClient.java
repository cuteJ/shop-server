package com.onlythinking.shop.app.core.utils;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.Bucket;
import com.aliyun.oss.model.OSSObject;
import com.onlythinking.starter.oss.client.AppOssClient;
import com.onlythinking.starter.oss.client.model.PutObjectRs;
import com.onlythinking.starter.oss.properties.OssProperties;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.InputStream;

/**
 * <p> AliyunOss </p>
 *
 * @author Li Xingping
 */
@Component
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class OtOssClient {

    private final AppOssClient<OSSClient, Bucket, OSSObject> ossClient;
    private final OssProperties properties;

    public PutObjectRs putObject(String objectKey, InputStream input) {
        return ossClient.putObject(properties.getDefaultBucket(), objectKey, input);
    }

    public PutObjectRs putObject(String objectKey, File input) {
        return ossClient.putObject(properties.getDefaultBucket(), objectKey, input);
    }

    public void deleteObject(String objectKey) {
        ossClient.deleteObject(properties.getDefaultBucket(), objectKey);
    }

    public InputStream getObject(String objectKey) {
        OSSObject rs = ossClient.getObject(properties.getDefaultBucket(), objectKey);
        return rs.getObjectContent();
    }

    public String getEndpoint() {
        return properties.getEndpoint();
    }

    public String getDomainUrl() {
        return properties.getDomainUrl();
    }

}
