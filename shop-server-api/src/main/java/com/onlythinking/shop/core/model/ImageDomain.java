package com.onlythinking.shop.core.model;

import com.google.common.base.Throwables;
import com.onlythinking.commons.exception.GlobalErrorCode;
import com.onlythinking.commons.exception.RespondedException;
import lombok.Data;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotBlank;

import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
public class ImageDomain implements Serializable {

    @NotBlank
    private String imageName;
    @NotBlank
    private String content; // base64

    private byte[] toRowData() {
        return Base64.getDecoder().decode(this.content.getBytes(Charset.forName("UTF-8")));
    }

    /**
     * <p>
     * 将Base64字符(content)解码后保存到指定路径
     * </p>
     *
     * @param filePath 文件路径
     */
    public void writeFile(String filePath) throws IOException {
        FileUtils.writeByteArrayToFile(new File(filePath + imageName), toRowData());
    }

    public InputStream toInputStream() {
        return new ByteArrayInputStream(toRowData());
    }

    public static InputStream toInputStream(String base64Content) {
        return new ByteArrayInputStream(
          Base64.getDecoder().decode(base64Content.getBytes(Charset.forName("UTF-8")))
        );
    }

    /**
     * <p>
     * 将Base64字符(content)解码后保存到指定路径
     * </p>
     *
     * @param filePath    文件路径
     * @param imageDomain 图片对象
     */
    public static void writeFile(String filePath, ImageDomain imageDomain) throws IOException {
        if (null == imageDomain) {
            return;
        }
        FileUtils.writeByteArrayToFile(new File(filePath + imageDomain.imageName), imageDomain.toRowData());
    }

    /**
     * <p>
     * 拼接 <img> 标签内容
     * </p>
     *
     * @param imageDomain 图片对象
     */
    public static String base64Img(ImageDomain imageDomain) {
        if (null == imageDomain) {
            return StringUtils.EMPTY;
        }
        return "data:image/png;base64," + imageDomain.getContent();
    }

    /**
     * <p>
     * 拼接 <img> 标签内容
     * </p>
     *
     * @param inputStream 流对象
     */
    public static String base64ImgOfStream(InputStream inputStream) throws IOException {
        if (null == inputStream) {
            return StringUtils.EMPTY;
        }
        return "data:image/png;base64," + IOUtils.toString(inputStream, StandardCharsets.UTF_8);
    }

    /**
     * <p>
     * 根据图片URL下载图片并且转换为Base64字符返回
     * </p>
     *
     * @param imageUrl 图片地址
     * @return Base64 字符
     */
    public static String downloadImageToContent(String imageUrl) {
        try (InputStream in = new URL(imageUrl).openStream()) {
            return Base64.getEncoder().encodeToString(IOUtils.toByteArray(in));
        } catch (IOException e) {
            throw new RespondedException(GlobalErrorCode.API_VIOLATION_ERROR, String.format("下载 %s 失败: %s", imageUrl, Throwables.getRootCause(e)));
        }
    }

}
