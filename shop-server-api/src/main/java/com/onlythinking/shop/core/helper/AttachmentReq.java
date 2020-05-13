package com.onlythinking.shop.core.helper;

import lombok.Builder;
import lombok.Data;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Builder
@Data
public class AttachmentReq {
    @NotBlank
    private String domain;
    @NotBlank
    private String businessNo;
    @NotBlank
    private String businessType;

    public String objectKey(String originalFilename, boolean rename) {
        return this.domain + "/" + businessNo + "/" + businessType + "/" + (rename ?
          DateFormatUtils.format(new Date(), "yyyyMMddHHmmss") + "." + FilenameUtils.getExtension(originalFilename) : originalFilename);
    }

    public String objectKey(String originalFilename) {
        return objectKey(originalFilename, true);
    }

}
