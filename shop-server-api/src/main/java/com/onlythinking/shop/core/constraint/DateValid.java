package com.onlythinking.shop.core.constraint;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Target({METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER})
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = {DateValidValidator.class})
public @interface DateValid {

    String message() default "{date.validation.valid.message}";

    String format() default "yyyyMMdd";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
