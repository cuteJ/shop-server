package com.onlythinking.shop.mgt.system.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.mgt.core.utils.avatar.IdenticonRenderer;
import com.onlythinking.shop.mgt.core.utils.avatar.IdenticonUtil;
import com.onlythinking.shop.mgt.core.utils.avatar.NineBlockIdenticonRenderer2;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.RenderedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@Api(tags = "不受保护")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@ApiRest(serviceId = AppSystem.SERVER_INSECURE)
public class InsecureMgtController {

    private static final String IDENTICON_IMAGE_FORMAT = "PNG";
    private static final String IDENTICON_IMAGE_MIMETYPE = "image/png";

    private IdenticonRenderer renderer = new NineBlockIdenticonRenderer2();

    @ApiOperation("Avatar")
    @GetMapping(value = "/avatar")
    public void avatars(@RequestParam("code") String codeParam,
                        @RequestParam("size") String sizeParam,
                        HttpServletRequest request, HttpServletResponse response) throws IOException {

        int code = IdenticonUtil.getIdenticonCode(codeParam, request.getRemoteAddr());
        int size = IdenticonUtil.getIdenticonSize(sizeParam);
        ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
        RenderedImage image = renderer.render(code, size);
        ImageIO.write(image, IDENTICON_IMAGE_FORMAT, byteOut);
        byte[] imageBytes = byteOut.toByteArray();
        response.setContentType(IDENTICON_IMAGE_MIMETYPE);
        response.setContentLength(imageBytes.length);
        response.getOutputStream().write(imageBytes);
    }
}
