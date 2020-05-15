package com.onlythinking.shop.mgt.core.utils;

import com.google.common.collect.Sets;
import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.mgt.core.constant.PermissionsConstant;
import com.onlythinking.shop.model.OtSysApiList;
import com.onlythinking.shop.model.OtSysAuthority;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.reflections.Reflections;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.*;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@Component
public class ClassScanner {

    private final static Map<String, String> AUTH_MAP = new HashMap<>();

    static {
        AUTH_MAP.put(PermissionsConstant.SYS, "系统管理");

        AUTH_MAP.put(PermissionsConstant.SYS_USER, "用户管理");
        AUTH_MAP.put(PermissionsConstant.SYS_USER_LIST, "列表");
        AUTH_MAP.put(PermissionsConstant.SYS_USER_SAVE, "保存");
        AUTH_MAP.put(PermissionsConstant.SYS_USER_REMOVE, "删除");
        AUTH_MAP.put(PermissionsConstant.SYS_USER_LOCK, "锁定");
        AUTH_MAP.put(PermissionsConstant.SYS_USER_GRANT, "角色授权");
        AUTH_MAP.put(PermissionsConstant.SYS_USER_OPTLOG, "操作日志");

        AUTH_MAP.put(PermissionsConstant.SYS_ROLE, "角色管理");
        AUTH_MAP.put(PermissionsConstant.SYS_ROLE_LIST, "列表");
        AUTH_MAP.put(PermissionsConstant.SYS_ROLE_SAVE, "保存");
        AUTH_MAP.put(PermissionsConstant.SYS_ROLE_REMOVE, "删除");
        AUTH_MAP.put(PermissionsConstant.SYS_ROLE_GRANT, "授权");

        AUTH_MAP.put(PermissionsConstant.SYS_MENU, "菜单管理");
        AUTH_MAP.put(PermissionsConstant.SYS_MENU_LIST, "列表");
        AUTH_MAP.put(PermissionsConstant.SYS_MENU_SAVE, "保存");
        AUTH_MAP.put(PermissionsConstant.SYS_MENU_REMOVE, "删除");
        AUTH_MAP.put(PermissionsConstant.SYS_MENU_GRANT, "授权");

        AUTH_MAP.put(PermissionsConstant.SYS_AUTHORITY, "权限管理");
        AUTH_MAP.put(PermissionsConstant.SYS_AUTHORITY_LIST, "列表");
        AUTH_MAP.put(PermissionsConstant.SYS_AUTHORITY_SAVE, "保存");
        AUTH_MAP.put(PermissionsConstant.SYS_AUTHORITY_REMOVE, "删除");

        AUTH_MAP.put(PermissionsConstant.SYS_APILIST, "接口列表");
        AUTH_MAP.put(PermissionsConstant.SYS_APILIST_LIST, "列表");
        AUTH_MAP.put(PermissionsConstant.SYS_APILIST_SAVE, "保存");
        AUTH_MAP.put(PermissionsConstant.SYS_APILIST_REMOVE, "删除");

        AUTH_MAP.put(PermissionsConstant.SYS_QUARTZJOB, "定时任务");
        AUTH_MAP.put(PermissionsConstant.SYS_QUARTZJOB_LIST, "列表");
        AUTH_MAP.put(PermissionsConstant.SYS_QUARTZJOB_SAVE, "保存");
        AUTH_MAP.put(PermissionsConstant.SYS_QUARTZJOB_REMOVE, "删除");
        AUTH_MAP.put(PermissionsConstant.SYS_QUARTZJOB_OPT, "启动，停止操作");

        AUTH_MAP.put(PermissionsConstant.SYS_DB, "数据字典");
        AUTH_MAP.put(PermissionsConstant.SYS_DB_LIST, "列表");
        AUTH_MAP.put(PermissionsConstant.SYS_DB_SYNC, "同步表结构");

        AUTH_MAP.put(PermissionsConstant.APP, "应用管理");
        AUTH_MAP.put(PermissionsConstant.APP_BRAND, "应用品牌");
        AUTH_MAP.put(PermissionsConstant.APP_BRAND_LIST, "列表");
        AUTH_MAP.put(PermissionsConstant.APP_BRAND_SAVE, "保存");
        AUTH_MAP.put(PermissionsConstant.APP_BRAND_REMOVE, "删除");

        AUTH_MAP.put(PermissionsConstant.USER, "用户管理");
        AUTH_MAP.put(PermissionsConstant.USER_LOGIN, "用户列表");
        AUTH_MAP.put(PermissionsConstant.USER_LOGIN_LIST, "列表");
    }

    public Set<OtSysAuthority> toSysAuthorities(Set<OtSysApiList> apiLists) {
        Set<String> codes = apiLists.stream().map(OtSysApiList::getShiroCode).collect(Collectors.toSet());
        Set<OtSysAuthority> authorities = Sets.newHashSet();
        for (String code : codes) {
            if (StringUtils.isBlank(code)) {
                continue;
            }
            String[] apiCodes = StringUtils.split(code, AppSystem.SEPARATOR_TIME);
            if (apiCodes.length < 3) {
                log.error("权限 {} 格式不符合", code);
                continue;
            }
            OtSysAuthority authority = new OtSysAuthority();
            authority.setId(code);
            authority.setModule(apiCodes[0]);
            authority.setDomain(apiCodes[1]);
            authority.setAction(apiCodes[2]);
            authority.setParentId(apiCodes[0] + AppSystem.SEPARATOR_TIME + apiCodes[1]);
            authority.setAuthorityName(AUTH_MAP.get(code));
            authorities.add(authority);
        }
        Set<String> modules = authorities.stream().map(OtSysAuthority::getModule).collect(Collectors.toSet());
        Set<String> domains = authorities.stream().map(v -> v.getModule() + AppSystem.SEPARATOR_TIME + v.getDomain()).collect(Collectors.toSet());

        for (String m : modules) {
            OtSysAuthority authority = new OtSysAuthority();
            authority.setId(m);
            authority.setModule(m);
            authority.setDomain(m);
            authority.setAction(AppSystem.SEPARATOR_MENU);
            authority.setAuthorityName(AUTH_MAP.get(m));
            authorities.add(authority);
        }

        for (String m : domains) {
            OtSysAuthority authority = new OtSysAuthority();
            String[] md = StringUtils.split(m, AppSystem.SEPARATOR_TIME);
            authority.setId(m);
            authority.setParentId(md[0]);
            authority.setModule(md[0]);
            authority.setDomain(md[1]);
            authority.setAction(AppSystem.SEPARATOR_MENU);
            authority.setAuthorityName(AUTH_MAP.get(m));
            authorities.add(authority);
        }

        return authorities;
    }

    public Set<OtSysApiList> doScan(String... basePackages) {
        Set<OtSysApiList> beanDefinitions = new LinkedHashSet<>();
        for (String basePackage : basePackages) {
            beanDefinitions.addAll(findCandidateComponents(basePackage));
        }
        return beanDefinitions;
    }

    public Set<OtSysApiList> findCandidateComponents(String basePackage) {
        Set<OtSysApiList> candidates = new LinkedHashSet<>();
        try {
            Reflections reflections = new Reflections(basePackage);
            Set<Class<?>> allClasses = reflections.getTypesAnnotatedWith(ApiRest.class);
            for (Class clazz : allClasses) {
                ApiRest apiRest = AnnotationUtils.getAnnotation(clazz, ApiRest.class);
                Api api = AnnotationUtils.getAnnotation(clazz, Api.class);
                String apiBasePath;
                if (null == apiRest) {
                    continue;
                }
                apiBasePath = "/api/" + apiRest.serviceId() + (ArrayUtils.isEmpty(apiRest.value()) ? StringUtils.EMPTY : apiRest.value()[0]);
                Method[] methods = ReflectionUtils.getAllDeclaredMethods(clazz);
                for (Method method : methods) {
                    // 只保留控制权限的API
                    RequiresPermissions requiresPermissions = AnnotationUtils.getAnnotation(method, RequiresPermissions.class);
                    ApiOperation apiOperation = AnnotationUtils.getAnnotation(method, ApiOperation.class);
                    Set<String> apiUrls = getAPiUrl(apiBasePath, method);
                    for (String apiUrl : apiUrls) {
                        OtSysApiList authority = new OtSysApiList();
                        authority.setApiUrl(apiUrl);
                        authority.setApiTag(null != api && ArrayUtils.isNotEmpty(api.tags()) ? api.tags()[0] : null);
                        if (null != requiresPermissions) {
                            authority.setShiroCode(ArrayUtils.isNotEmpty(requiresPermissions.value()) ? requiresPermissions.value()[0] : null);
                        }
                        authority.setApiName(null != apiOperation ? apiOperation.value() : null);
                        candidates.add(authority);
                    }
                }
            }
        } catch (Exception ex) {
            throw new RuntimeException("I/O failure during classpath scanning", ex);
        }
        return candidates;
    }

    public Set<String> getClassNamePackages(String... basePackages) throws IOException {
        Set<String> classNames = new LinkedHashSet<>();
        for (String basePackage : basePackages) {
            classNames.addAll(PackageUtils.getClassName(basePackage));
        }
        return classNames;
    }

    private Set<String> getAPiUrl(String basePath, Method method) {
        RequestMapping requestMapping = AnnotationUtils.getAnnotation(method, RequestMapping.class);
        GetMapping getMapping = AnnotationUtils.getAnnotation(method, GetMapping.class);
        PostMapping postMapping = AnnotationUtils.getAnnotation(method, PostMapping.class);
        PutMapping putMapping = AnnotationUtils.getAnnotation(method, PutMapping.class);
        DeleteMapping deleteMapping = AnnotationUtils.getAnnotation(method, DeleteMapping.class);
        Set<String> apiUrls = new HashSet<>();
        if (null != requestMapping && !ArrayUtils.isEmpty(requestMapping.value())) {
            for (String v : requestMapping.value()) {
                apiUrls.add(basePath + v);
            }
        } else if (null != getMapping && !ArrayUtils.isEmpty(getMapping.value())) {
            for (String v : getMapping.value()) {
                apiUrls.add(basePath + v);
            }
        } else if (null != postMapping && !ArrayUtils.isEmpty(postMapping.value())) {
            for (String v : postMapping.value()) {
                apiUrls.add(basePath + v);
            }
        } else if (null != putMapping && !ArrayUtils.isEmpty(putMapping.value())) {
            for (String v : putMapping.value()) {
                apiUrls.add(basePath + v);
            }
        } else if (null != deleteMapping && !ArrayUtils.isEmpty(deleteMapping.value())) {
            for (String v : deleteMapping.value()) {
                apiUrls.add(basePath + v);
            }
        }
        return apiUrls;
    }
}
