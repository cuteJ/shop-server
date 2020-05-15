package com.onlythinking.shop.mgt.core.mysql;

import com.google.common.collect.Lists;
import com.onlythinking.shop.model.OtColumnMetadata;
import com.onlythinking.shop.model.OtTableMetadata;
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
public class TableMetadataDto extends OtTableMetadata {
    private List<OtColumnMetadata> columns = Lists.newArrayList();
}
