package com.onlythinking.shop.core.helper;

import lombok.Data;

import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
public class AttachmentResp {

    private String objectKey;
    private String url;
    private Object data;
    private Map<String, Object> files;
}
