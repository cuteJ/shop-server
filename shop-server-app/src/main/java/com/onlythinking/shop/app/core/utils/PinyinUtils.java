package com.onlythinking.shop.app.core.utils;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import net.sourceforge.pinyin4j.PinyinHelper;
import org.apache.commons.lang3.StringUtils;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class PinyinUtils {

    public static String chineseToPinyin(String chinese) {
        StringBuilder py = new StringBuilder();
        String chi = chinese.replaceAll("(?i)[^a-zA-Z0-9\u4E00-\u9FA5]", StringUtils.EMPTY);
        for (char c : chi.toCharArray()) {
            if (c < 0xFF) {
                continue;
            }
            String f = PinyinHelper.toHanyuPinyinStringArray(c)[0];
            py.append(StringUtils.substring(f, 0, f.length() - 1));
        }
        return py.toString();
    }

    public static String[] chineseToPinyinAndJp(String chinese) {
        StringBuilder py = new StringBuilder();
        StringBuilder jp = new StringBuilder();
        String chi = chinese.replaceAll("(?i)[^a-zA-Z0-9\u4E00-\u9FA5]",  StringUtils.EMPTY);
        for (char c : chi.toCharArray()) {
            if (c < 0xFF) {
                continue;
            }
            String f = PinyinHelper.toHanyuPinyinStringArray(c)[0];
            jp.append(f.charAt(0));
            py.append(StringUtils.substring(f, 0, f.length() - 1));
        }
        return new String[]{jp.toString(), py.toString()};
    }
}
