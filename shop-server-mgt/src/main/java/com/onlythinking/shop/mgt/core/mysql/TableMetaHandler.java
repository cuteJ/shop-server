package com.onlythinking.shop.mgt.core.mysql;

import com.google.common.collect.Lists;
import com.onlythinking.shop.core.utils.UUIDUtils;
import com.onlythinking.shop.mgt.core.constant.JdbcLabelConstants;
import com.onlythinking.shop.model.OtColumnMetadata;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Component
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class TableMetaHandler {

    private final DataSource dataSource;

    public List<TableMetadataDto> generateTableMetadata() {
        return generateTableMetadata("ot%");
    }

    public List<TableMetadataDto> generateTableMetadata(String tableNamePattern) {
        List<TableMetadataDto> metaData = Lists.newArrayList();
        try {
            Connection connection = dataSource.getConnection();
            String catalog = connection.getCatalog();
            DatabaseMetaData dbMetadata = connection.getMetaData();
            ResultSet rs = dbMetadata.getTables(null, null, tableNamePattern, null);
            while (rs.next()) {
                String tableName = rs.getString(JdbcLabelConstants.TABLE_NAME);
                String remarks = rs.getString(JdbcLabelConstants.REMARKS);
                String tableType = rs.getString(JdbcLabelConstants.TYPE_NAME);
                String typeScheme = rs.getString(JdbcLabelConstants.TYPE_SCHEM);

                String tableId = UUIDUtils.getUUID();
                TableMetadataDto data = new TableMetadataDto();
                data.setId(tableId);
                data.setTableName(tableName);
                data.setTableType(tableType);
                data.setTableScheme(typeScheme);
                data.setRemarks(remarks);

                ResultSet pkRs = dbMetadata.getPrimaryKeys(catalog, null, tableName);
                String pkNames = null;
                while (pkRs.next()) {
                    pkNames = pkRs.getString(JdbcLabelConstants.COLUMN_NAME) + " ";
                }
                data.setPkName(pkNames);

                ResultSet crs = dbMetadata.getColumns(catalog, null, tableName, "%");
                while (crs.next()) {
                    String columnName = crs.getString(JdbcLabelConstants.COLUMN_NAME);
                    String columnComment = crs.getString(JdbcLabelConstants.REMARKS);
                    String typeName = crs.getString(JdbcLabelConstants.TYPE_NAME);
                    int dataSize = crs.getInt(JdbcLabelConstants.COLUMN_SIZE);
                    int digits = crs.getInt(JdbcLabelConstants.DECIMAL_DIGITS);
                    int nullable = crs.getInt(JdbcLabelConstants.NULLABLE);

                    OtColumnMetadata colData = new OtColumnMetadata();
                    colData.setId(UUIDUtils.getUUID());
                    colData.setTableId(tableId);
                    colData.setColumnName(columnName);
                    colData.setRemarks(columnComment);
                    colData.setTypeName(toTypeName(typeName, dataSize, digits));
                    colData.setColumnSize(dataSize);
                    colData.setDecimalDigits(digits);
                    colData.setNotNull(nullable == 0);

                    data.getColumns().add(colData);
                }
                metaData.add(data);
            }

        } catch (SQLException e) {
            log.error("获取表结构数据出错", e);
        }
        return metaData;
    }

    private String toTypeName(String typeName, int dataSize, int digits) {

        if (JdbcLabelConstants.VARCHAR.equalsIgnoreCase(typeName)
          || JdbcLabelConstants.VARCHAR2.equalsIgnoreCase(typeName)
          || JdbcLabelConstants.INT.equalsIgnoreCase(typeName)
          || JdbcLabelConstants.BIT.equalsIgnoreCase(typeName)
        ) {
            return typeName + "(" + dataSize + ")";
        } else if (JdbcLabelConstants.DECIMAL.equalsIgnoreCase(typeName)) {
            return typeName + "(" + dataSize + "," + digits + ")";
        }

        return typeName;
    }
}
