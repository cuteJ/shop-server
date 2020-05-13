package com.onlythinking.shop.core.utils;

import com.onlythinking.commons.exception.RespondedException;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.regex.Pattern;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class Validations {

    private static Pattern REAL_NAME_PATTERN = Pattern.compile("^([\\u4e00-\\u9fa5]+|([a-zA-Z]+\\s?)+)$");
    private static Pattern CELL_NO_PATTERN = Pattern.compile("^1(\\d{10})$");
    private static Pattern EMAIL_PATTERN = Pattern.compile("\\b(^(\\S+@).+((\\.com)|(\\.net)|(\\.org)|(\\.info)|(\\.edu)|(\\.mil)|(\\.gov)|(\\.biz)|(\\.ws)|(\\.us)|(\\.tv)|(\\.cc)|(\\..{2,2}))$)\\b$");
    private static Pattern USERNAME_PATTERN = Pattern.compile("^[A-Za-z]{1}([A-Za-z0-9_]{5,15})$");
    private static Pattern PASSWORD_PATTERN = Pattern.compile("^[A-Za-z0-9_]{6,16}$");
    private static Pattern SERIAL_PATTERN = Pattern.compile("^[0-9]{15,20}$");
    private static Pattern AMOUNT_PATTERN = Pattern.compile("^-?\\d+(\\.\\d+)?$");
    private static Pattern INT_PATTERN = Pattern.compile("^[0-9]+$");
    private static Pattern ZIP_CODE = Pattern.compile("^[0-9]{6}$");
    private static Pattern VERIFY_CODE = Pattern.compile("^[0-9]{6}$");

    private static boolean validatePattern(Pattern pattern, String input) {
        return pattern.matcher(input).find();
    }

    public static boolean validateRealName(String realName) {
        return validatePattern(REAL_NAME_PATTERN, realName);
    }

    public static boolean validateCellNo(String cellNo) {
        return validatePattern(CELL_NO_PATTERN, cellNo);
    }

    public static boolean validateEmail(String email) {
        return validatePattern(EMAIL_PATTERN, email);
    }

    public static boolean validateUserName(String userName) {
        return validatePattern(USERNAME_PATTERN, userName);
    }

    public static boolean validatePassword(String password) {
        return validatePattern(PASSWORD_PATTERN, password);
    }

    public static boolean validateSerial(String serial) {
        return validatePattern(SERIAL_PATTERN, serial);
    }

    public static boolean validateAmount(double amount) {
        return validatePattern(AMOUNT_PATTERN, String.valueOf(amount));
    }

    public static boolean validateInt(String num) {
        return validatePattern(INT_PATTERN, String.valueOf(num));
    }

    public static boolean validateZipCode(String zipCode) {
        return validatePattern(ZIP_CODE, zipCode);
    }

    public static boolean validateVerifyCode(String code) {
        return validatePattern(ZIP_CODE, code);
    }

    public static boolean validateErrorIfException(String msg, boolean errorIfException) {
        if (errorIfException) {
            throw RespondedException.argumentInvalid(msg);
        }
        return false;
    }


}
