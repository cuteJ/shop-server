package com.onlythinking.shop.init;

import com.onlythinking.shop.init.initializer.*;
import com.onlythinking.shop.mapper.*;
import com.onlythinking.shop.mgt.core.utils.ClassScanner;
import com.onlythinking.shop.mgt.system.service.InfraSystemService;
import com.onlythinking.shop.mgt.system.service.RegionService;
import com.onlythinking.shop.mgt.system.service.SysMetadataService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Component
public class InitializerService {

    private final InfraSystemService infraSystemService;
    private final OtSysRoleMapper sysRoleMapper;
    private final OtSysUserMapper sysUserMapper;
    private final ClassScanner classScanner;
    private final OtSysAuthorityMapper sysAuthorityMapper;
    private final OtSysApiListMapper sysApiListMapper;
    private final OtSysMenuAuthorityRelMapper sysMenuAuthorityRelMapper;
    private final OtSysRoleAuthorityRelMapper sysRoleAuthorityRelMapper;
    private final OtSysTypeDicMapper sysTypeDicMapper;
    private final OtSysDicMapper sysDicMapper;
    private final OtSysMenuMapper sysMenuMapper;

    private final OtSysUserRoleRelMapper sysUserRoleRelMapper;
    private final OtSysRoleMenuRelMapper sysRoleMenuRelMapper;

    private final PlatformTransactionManager transactionManager;
    private final SysMetadataService sysMetadataService;
    private final RegionService regionService;

    // 全部初始化
    public void reInit() {
        Initializer dics = new DicsInitializer(sysTypeDicMapper, sysDicMapper);
        Initializer apis = new ApisInitializer(classScanner, sysAuthorityMapper, sysApiListMapper, sysMenuAuthorityRelMapper, sysRoleAuthorityRelMapper);
        Initializer menus = new MenusInitializer(sysMenuMapper);
        Initializer admin = new AdminInitializer(sysUserMapper, sysRoleMapper, sysUserRoleRelMapper, sysRoleMenuRelMapper);
        Initializer grant = new GrantInitializer(infraSystemService, sysRoleMapper, sysUserMapper, sysAuthorityMapper, sysMenuMapper);
        Initializer dbMeta = new DBMetaInitializer(sysMetadataService);
//        Initializer region = new RegionInitializer(regionService);

        dics.buildNext(apis).buildNext(menus).buildNext(admin).buildNext(grant).buildNext(dbMeta);
        execute(dics);
    }

    // 初始化单个
    public void initSingle(String type) {
        if ("apis".equalsIgnoreCase(type)) {
            execute(new ApisInitializer(classScanner,
              sysAuthorityMapper,
              sysApiListMapper,
              sysMenuAuthorityRelMapper,
              sysRoleAuthorityRelMapper)
            );
        } else if ("dics".equalsIgnoreCase(type)) {
            execute(new DicsInitializer(sysTypeDicMapper, sysDicMapper));
        } else if ("menus".equalsIgnoreCase(type)) {
            execute(new MenusInitializer(sysMenuMapper));
        } else if ("admin".equalsIgnoreCase(type)) {
            execute(new AdminInitializer(sysUserMapper, sysRoleMapper, sysUserRoleRelMapper, sysRoleMenuRelMapper));
        } else if ("grant".equalsIgnoreCase(type)) {
            execute(new GrantInitializer(infraSystemService, sysRoleMapper, sysUserMapper, sysAuthorityMapper, sysMenuMapper));
        }
    }

    private void execute(Initializer initializer) {
        Initializer init = initializer;
        do {
            TransactionStatus beforeStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
            try {
                init.before();
                transactionManager.commit(beforeStatus);
            } catch (Exception e) {
                log.error("初始化Before出现错误", e);
                transactionManager.rollback(beforeStatus);
                throw e;
            }

            TransactionStatus processStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
            try {
                init.process();
                transactionManager.commit(processStatus);
            } catch (Exception e) {
                log.error("初始化Process出现错误", e);
                transactionManager.rollback(processStatus);
                throw e;
            }

            init = init.getNext();
        } while (null != init);
    }

}
