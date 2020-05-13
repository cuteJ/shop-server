package com.onlythinking.shop.core.helper;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;

import java.util.Date;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public final class SequenceBuilder {

    // todo 制订序列号生成规则

    public static String orderNo(String merchantNo) {
        return DateFormatUtils.format(new Date(), "yyyyMMddHHmmss") + merchantNo + RandomStringUtils.randomNumeric(6);
    }

    public static String refundNo(String merchantNo) {
        return DateFormatUtils.format(new Date(), "yyyyMMddHHmmss") + merchantNo + RandomStringUtils.randomNumeric(6);
    }

    public static String txNo(String merchantNo) {
        return merchantNo + DateFormatUtils.format(new Date(), "yyyyMMddHHmmss") + RandomStringUtils.randomNumeric(6);
    }

    public static String couponNo() {
        return RandomStringUtils.randomNumeric(6);
    }
}
