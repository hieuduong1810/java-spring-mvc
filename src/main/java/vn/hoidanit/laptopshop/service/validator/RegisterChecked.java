package vn.hoidanit.laptopshop.service.validator;

import java.lang.annotation.*;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Constraint(validatedBy = RegisterValidator.class)
@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RegisterChecked {
  String message() default "Register validator failed";

  Class<?>[] groups() default {};

  Class<? extends Payload>[] payload() default {};
}
