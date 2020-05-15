package com.onlythinking.shop.init.initializer;

import com.google.common.collect.ImmutableMap;
import com.onlythinking.shop.mapper.*;
import com.onlythinking.shop.mgt.core.utils.ClassScanner;
import com.onlythinking.shop.model.OtSysApiList;
import com.onlythinking.shop.model.OtSysAuthority;
import com.onlythinking.shop.model.OtSysMenuAuthorityRel;
import com.onlythinking.shop.model.OtSysRoleAuthorityRel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor
public class ApisInitializer implements Initializer {

    private Initializer next;

    @Override
    public Initializer getNext() {
        return next;
    }

    @Override
    public Initializer buildNext(Initializer next) {
        this.next = next;
        return this.next;
    }

    private final ClassScanner classScanner;
    private final OtSysAuthorityMapper sysAuthorityMapper;
    private final OtSysApiListMapper sysApiListMapper;
    private final OtSysMenuAuthorityRelMapper sysMenuAuthorityRelMapper;
    private final OtSysRoleAuthorityRelMapper sysRoleAuthorityRelMapper;

    @Override
    public void before() {
        log.info("开始初始化APIS....");
        List<OtSysApiList> dbApiLists = sysApiListMapper.getList(new HashMap<>());
        if (CollectionUtils.isNotEmpty(dbApiLists)) {
            sysApiListMapper.deleteInBatch(dbApiLists.stream().map(OtSysApiList::getId).collect(Collectors.toList()));
        }
        List<OtSysAuthority> dbMenus = sysAuthorityMapper.getList(new HashMap<>());
        if (CollectionUtils.isNotEmpty(dbMenus)) {

            for (OtSysAuthority authority : dbMenus) {
                List<OtSysMenuAuthorityRel> menuAuthorityRels = sysMenuAuthorityRelMapper.getList(ImmutableMap.of("authorityId", authority.getId()));
                if (CollectionUtils.isNotEmpty(menuAuthorityRels)) {
                    sysMenuAuthorityRelMapper.deleteInBatch(menuAuthorityRels.stream().map(OtSysMenuAuthorityRel::getId).collect(Collectors.toList()));
                }

                List<OtSysRoleAuthorityRel> roleAuthorityRels = sysRoleAuthorityRelMapper.getList(ImmutableMap.of("authorityId", authority.getId()));
                if (CollectionUtils.isNotEmpty(roleAuthorityRels)) {
                    sysRoleAuthorityRelMapper.deleteInBatch(roleAuthorityRels.stream().map(OtSysRoleAuthorityRel::getId).collect(Collectors.toList()));
                }
            }

            sysAuthorityMapper.deleteInBatch(dbMenus.stream().map(OtSysAuthority::getId).collect(Collectors.toList()));
        }
    }

    @Override
    public void process() {
        Set<OtSysApiList> apiLists = classScanner.doScan("com.onlythinking.shop.mgt");
        Set<OtSysAuthority> authorities = classScanner.toSysAuthorities(apiLists);
        for (OtSysApiList dto : apiLists) {
            dto.setApiName(StringUtils.isBlank(dto.getApiName()) ? "None" : dto.getApiName());
            sysApiListMapper.insert(dto);
        }
        for (OtSysAuthority dto : authorities) {
            sysAuthorityMapper.insert(dto);
        }
        log.info("初始化APIS结束");
    }

}
