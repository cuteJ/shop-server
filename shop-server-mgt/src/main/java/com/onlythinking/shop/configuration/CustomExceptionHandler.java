package com.onlythinking.shop.configuration;

import com.google.common.base.Throwables;
import com.onlythinking.commons.exception.AbstractRespondedExceptionHandler;
import com.onlythinking.commons.exception.GlobalErrorCode;
import com.onlythinking.commons.exception.RespondedBody;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.boot.autoconfigure.web.ErrorAttributes;
import org.springframework.boot.autoconfigure.web.ErrorProperties;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * <p> 本应用类异常处理|覆盖全局异常处理 </p>
 *
 * @author Li Xingping
 */
@Slf4j
@Order(Ordered.HIGHEST_PRECEDENCE)
@RestControllerAdvice
public class CustomExceptionHandler extends AbstractRespondedExceptionHandler {

    public CustomExceptionHandler(ErrorProperties errorProperties, ErrorAttributes errorAttributes, MessageSource messageSource) {
        super(errorProperties, errorAttributes, messageSource);
    }

    @ExceptionHandler({UnauthorizedException.class})
    @ResponseBody
    public ResponseEntity<Object> handleUnauthorizedException(final UnauthorizedException ex) {
        log.error(Throwables.getRootCause(ex).getMessage());
        return ResponseEntity.ok(RespondedBody.of(GlobalErrorCode.SC_FORBIDDEN, super.getMessageSource().getMessage("mgt.error.403", null, LocaleContextHolder.getLocale())));
    }
}
