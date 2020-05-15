package com.onlythinking.shop.mgt.core.trace;

import com.alibaba.fastjson.JSON;
import com.google.common.base.Throwables;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.utils.IPUtils;
import com.onlythinking.shop.core.utils.IpAddress;
import com.onlythinking.shop.mapper.OtSysOptLogMapper;
import com.onlythinking.shop.mgt.core.utils.SessionUtils;
import com.onlythinking.shop.model.OtSysOptLog;
import com.onlythinking.shop.model.OtSysUser;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ArrayUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Optional;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@Aspect
@Component
public class SimpleProcessTracingOpt {

    private final OtSysOptLogMapper repository;
    private final IpAddress ipAddress;

    @Autowired
    public SimpleProcessTracingOpt(OtSysOptLogMapper repository, IpAddress ipAddress) {
        this.repository = repository;
        this.ipAddress = ipAddress;
    }

    @Pointcut("within(com.onlythinking.shop.mgt.*.web.*)")
    public void allMethod() {
    }

    @Around("allMethod() && @annotation(tracing)")
    public Object tracingOpt(ProceedingJoinPoint pjp, TracingOpt tracing) throws Throwable {
        Object[] args = pjp.getArgs();
        Signature signature = pjp.getSignature();
        String targetMethod = signature.getDeclaringTypeName() + "." + signature.getName();
        log.info("-----------------------------------{}--------------------------->>>>>", tracing.value());
        Optional.of(args).ifPresent(a -> log.info("请求参数：{}", Arrays.toString(a)));
        OtSysUser currentASysUser = SessionUtils.getCurrentASysUser(false);
        String username = AppSystem.OPERATOR_SYS;
        if (null != currentASysUser) {
            username = currentASysUser.getUsername();
        }
        Object retVal = pjp.proceed();

        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String ip = IPUtils.getRemoteIP(request);
            OtSysOptLog optLog = new OtSysOptLog();
            optLog.setOptIp(ip);
            optLog.setIpGeo(ipAddress.getAddresses(ip));
            optLog.setOperator(username);
            optLog.setOptName(tracing.value());
            if (ArrayUtils.isNotEmpty(args)) {
                optLog.setRequestData(JSON.toJSONString(args));
            }
            optLog.setRequestUrl(request.getRequestURI());
            repository.insert(optLog);
        } catch (Exception e) {
            log.error("Save optLog error: {}", Throwables.getRootCause(e).getMessage());
        }
        return retVal;
    }
}
