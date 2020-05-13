package com.onlythinking.shop.core.constraint;

import org.apache.commons.lang3.StringUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * <p> 字符类型时间校验 </p>
 *
 * @author Li Xingping
 */
public class DateValidValidator implements ConstraintValidator<DateValid, String> {

    private String format;

    @Override
    public void initialize(DateValid constraintAnnotation) {
        format = constraintAnnotation.format();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (StringUtils.isBlank(value)) return false;
        switch (format) {
            case "yyyyMMdd":
                return value.matches("\\d{4}\\d{2}\\d{2}");
            case "yyyy-MM-dd":
                return value.matches("\\d{4}-\\d{2}-\\d{2}");
        }
        return false;
    }
}
