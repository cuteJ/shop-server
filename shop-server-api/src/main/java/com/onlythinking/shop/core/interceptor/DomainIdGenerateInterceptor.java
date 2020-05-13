package com.onlythinking.shop.core.interceptor;

import com.onlythinking.shop.core.utils.UUIDUtils;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.*;
import org.springframework.util.ReflectionUtils;

import javax.persistence.Id;
import java.util.Arrays;
import java.util.Properties;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Intercepts({@Signature(type = Executor.class, method = "update", args = {MappedStatement.class, Object.class})})
public class DomainIdGenerateInterceptor implements Interceptor {

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
        SqlCommandType sqlCommandType = mappedStatement.getSqlCommandType();
        Object parameter = invocation.getArgs()[1];
        if (SqlCommandType.INSERT == sqlCommandType) {
            // Todo bug when list
            Arrays.stream(parameter.getClass().getDeclaredFields())
              .filter(field -> null != field.getAnnotation(Id.class)).findAny().ifPresent(
              field -> {
                  field.setAccessible(true);
                  if (null == ReflectionUtils.getField(field, parameter)) {
                      ReflectionUtils.setField(field, parameter, UUIDUtils.getUUID());
                  }
              }
            );
        }
        return invocation.proceed();
    }

    @Override
    public Object plugin(Object target) {
        if (target instanceof Executor) {
            return Plugin.wrap(target, this);
        } else {
            return target;
        }
    }

    @Override
    public void setProperties(Properties properties) {

    }
}
