package com.onlythinking.shop.mgt.core.utils;

import com.alibaba.fastjson.JSON;
import com.onlythinking.commons.exception.RespondedBody;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.springframework.http.MediaType;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class ResponseUtils {

    public static void response(ServletResponse response, MediaType mediaType, int statusCode, String message)
      throws IOException {
        HttpServletResponse resp = (HttpServletResponse) response;
        resp.setContentType(mediaType.toString());
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setStatus(statusCode);
        PrintWriter writer = resp.getWriter();
        writer.write(message);
        writer.flush();
    }

    public static void responseJson(ServletResponse response, int statusCode, Object message) throws IOException {
        response(response, MediaType.APPLICATION_JSON_UTF8, statusCode, JSON.toJSONString(message));
    }

    public static void response401(ServletResponse response) throws IOException {
        response(response, MediaType.APPLICATION_JSON_UTF8, HttpServletResponse.SC_OK,
          JSON.toJSONString(RespondedBody.of(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized")));
    }

    public static void response403(ServletResponse response) throws IOException {
        response(response, MediaType.APPLICATION_JSON_UTF8, HttpServletResponse.SC_FORBIDDEN,
          JSON.toJSONString(RespondedBody.of(HttpServletResponse.SC_FORBIDDEN, "Forbidden")));
    }

    public static void responseOk(ServletResponse response) throws IOException {
        response(response, MediaType.APPLICATION_JSON_UTF8, HttpServletResponse.SC_OK,
          JSON.toJSONString(RespondedBody.of(HttpServletResponse.SC_OK, "Ok")));
    }

    public static void responseFail(ServletResponse response, int errorCode, String message) throws IOException {
        response(response, MediaType.APPLICATION_JSON_UTF8, errorCode,
          JSON.toJSONString(RespondedBody.of(errorCode, message)));
    }

    public static void responseInvalidLogin(ServletResponse response, int statusCode) throws IOException {
        response(response, MediaType.ALL, statusCode, "login state is invalid");
    }

    public static void responseInvalidPermission(ServletResponse response, int statusCode) throws IOException {
        response(response, MediaType.ALL, statusCode, "you have no enough permission to access");
    }

}
