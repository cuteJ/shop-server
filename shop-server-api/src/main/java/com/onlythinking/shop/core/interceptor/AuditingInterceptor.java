package com.onlythinking.shop.core.interceptor;

import com.onlythinking.commons.core.interceptor.CreatedTime;
import com.onlythinking.commons.core.interceptor.LastModifiedTime;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.*;
import org.springframework.core.annotation.AnnotationUtils;

import java.lang.reflect.Field;
import java.util.Date;
import java.util.Properties;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Intercepts({@Signature(type = Executor.class, method = "update", args = {MappedStatement.class, Object.class})})
public class AuditingInterceptor implements Interceptor {

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
        SqlCommandType sqlCommandType = mappedStatement.getSqlCommandType();
        Object parameter = invocation.getArgs()[1];
        Field[] fields = parameter.getClass().getDeclaredFields();
        Date currentDate = new Date();
        if (SqlCommandType.UPDATE == sqlCommandType) {
            for (Field field : fields) {
                if (null != AnnotationUtils.getAnnotation(field, LastModifiedTime.class)) {
                    field.setAccessible(true);
                    field.set(parameter, currentDate);
                    field.setAccessible(false);
                }
            }
        } else if (SqlCommandType.INSERT == sqlCommandType) {
            for (Field field : fields) {
                if (null != AnnotationUtils.getAnnotation(field, CreatedTime.class)) {
                    field.setAccessible(true);
                    field.set(parameter, currentDate);
                    field.setAccessible(false);
                }
                if("disabled".equals(field.getName())){
                    field.setAccessible(true);
                    field.set(parameter, false);
                    field.setAccessible(false);
                }
            }
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
