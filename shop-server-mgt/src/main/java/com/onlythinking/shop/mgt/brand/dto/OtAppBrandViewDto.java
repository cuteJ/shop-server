package com.onlythinking.shop.mgt.brand.dto;

import com.onlythinking.shop.model.OtAppBrand;
import com.onlythinking.shop.model.OtAppMaConfig;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.util.List;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Data
public class OtAppBrandViewDto extends OtAppBrand {

    private List<OtAppMaConfig> maConfigs;
}
