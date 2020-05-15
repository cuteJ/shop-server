package com.onlythinking.shop.apidocs;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.onlythinking.shop.BaseTest;
import com.onlythinking.shop.mapper.OtSysDicMapper;
import io.github.swagger2markup.markup.builder.MarkupDocBuilder;
import io.github.swagger2markup.markup.builder.MarkupDocBuilders;
import io.github.swagger2markup.markup.builder.MarkupLanguage;
import io.github.swagger2markup.markup.builder.MarkupTableColumn;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import static com.onlythinking.commons.exception.GlobalErrorCode.*;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public class CustomDocBuilderTest extends BaseTest {

    @Autowired
    private OtSysDicMapper dicMapper;

    @Before
    public void setUp() {
    }

    @Test
    public void globalErrorCodeAsciiDocFile() throws IOException {
        MarkupDocBuilder builder = MarkupDocBuilders.documentBuilder(MarkupLanguage.ASCIIDOC);
        String outputDir = System.getProperty("io.swagger.ext.outputDir");
        builder
          .sectionTitleLevel1("全局响应CODE")
          .paragraph("全局响应CODE说明如下：")
          .tableWithColumnSpecs(
            Lists.newArrayList(
              new MarkupTableColumn("CODE"),
              new MarkupTableColumn("描述")
            ),
            getErrorCode().entrySet()
              .stream()
              .map(entry -> Lists.newArrayList(String.valueOf(entry.getKey()), entry.getValue()))
              .collect(Collectors.toList())
          )
          .writeToFile(Paths.get(outputDir + "/errorCode"), StandardCharsets.UTF_8);
    }

    @Test
    public void codeDictionaryAsciiDocFile() throws IOException {
        MarkupDocBuilder builder = MarkupDocBuilders.documentBuilder(MarkupLanguage.ASCIIDOC);
        String outputDir = System.getProperty("io.swagger.ext.outputDir");

        builder
          .sectionTitleLevel1("常量值对照")
          .tableWithColumnSpecs(
            Lists.newArrayList(
              new MarkupTableColumn("常量类型"),
              new MarkupTableColumn("常量编号"),
              new MarkupTableColumn("常量名称"),
              new MarkupTableColumn("常量备注"),
              new MarkupTableColumn("是否有效")
            ),
            dicMapper.getList(new HashMap<>())
              .stream()
              .map(codeInfo ->
                Lists.newArrayList(
                  codeInfo.getTypeCode(),
                  codeInfo.getValCode(),
                  codeInfo.getValName(),
                  codeInfo.getRemark(),
                  typeCodeStatus(codeInfo.getStatus())
                )
              ).sorted(Comparator.comparing(o -> o.get(1))).collect(Collectors.toList())
          )
          .writeToFile(Paths.get(outputDir + "/codeDictionary"), StandardCharsets.UTF_8);
    }

    private String typeCodeStatus(String status) {
        if ("100000".equals(status)) {
            return "是";
        } else {
            return "否";
        }
    }

    private Map<Integer, String> getErrorCode() {
        Map<Integer, String> errorCodeMap = Maps.newLinkedHashMap();
        // Http
        errorCodeMap.put(SC_BAD_REQUEST, "请求失败");
        errorCodeMap.put(SC_NOT_FOUND, "找不到资源");
        errorCodeMap.put(SC_UNAUTHORIZED, "未授权");
        errorCodeMap.put(SC_FORBIDDEN, "无权限");
        errorCodeMap.put(SC_METHOD_NOT_ALLOWED, "不支持的请求方法");
        errorCodeMap.put(SC_UNSUPPORTED_MEDIA_TYPE, "不支持的请求头");
        errorCodeMap.put(SC_INTERNAL_SERVER_ERROR, "应用内部错误");

        errorCodeMap.put(SYSTEM_BUSY, "系统繁忙，请稍后再试！");
        errorCodeMap.put(SUCCESSFUL, "请求成功");
        errorCodeMap.put(API_ARGUMENT_INVALID, "API请求参数校验不通过（如:NotBlank）");
        errorCodeMap.put(API_VIOLATION_ERROR, "实体或者方法参数约束校验不通过");
        errorCodeMap.put(UNDEFINED, "未定义的错误，请联系开发");

        //-----------------------------------------常用错误状态(0x7530-0x9c3F)---------------------------------------------------
        return errorCodeMap;
    }

}
