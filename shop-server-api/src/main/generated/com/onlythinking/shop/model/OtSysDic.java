package com.onlythinking.shop.model;

import com.onlythinking.commons.core.interceptor.CreatedTime;
import com.onlythinking.commons.core.interceptor.LastModifiedTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Id;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

/**
 * <p> This was generated by Ot Mybatis generator. </p>
 * 
 * ot_sys_dic
 * 
 * 字典信息
 * 
 * @author lixingping
 * Date 2020-05-07 16:48:33
 */
@Data
@ApiModel("字典信息")
public class OtSysDic implements Serializable {
    /**
     * ID
     */
    @Id
    @ApiModelProperty(value = "ID")
    private String id;

    /**
     * 创建时间
     */
    @ApiModelProperty(value = "创建时间")
    @CreatedTime
    private Date createdTime;

    /**
     * 最后修改时间
     */
    @ApiModelProperty(value = "最后修改时间")
    @LastModifiedTime
    private Date lastModifiedTime;

    /**
     * 备注（修改记录)
     */
    @ApiModelProperty(value = "备注（修改记录)")
    private String remark;

    /**
     * 是否启用（码类：1000）
     */
    @NotBlank
    @ApiModelProperty(value = "是否启用（码类：1000）", required = true)
    private String status;

    /**
     * 码类编码
     */
    @NotBlank
    @ApiModelProperty(value = "码类编码", required = true)
    private String typeCode;

    /**
     * 码值编码
     */
    @NotBlank
    @ApiModelProperty(value = "码值编码", required = true)
    private String valCode;

    /**
     * 码值名称
     */
    @NotBlank
    @ApiModelProperty(value = "码值名称", required = true)
    private String valName;

    private static final long serialVersionUID = 1L;
}