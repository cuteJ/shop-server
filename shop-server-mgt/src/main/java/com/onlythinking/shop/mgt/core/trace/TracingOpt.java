package com.onlythinking.shop.mgt.core.trace;

import java.lang.annotation.*;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface TracingOpt {

    String value() default "";
}
