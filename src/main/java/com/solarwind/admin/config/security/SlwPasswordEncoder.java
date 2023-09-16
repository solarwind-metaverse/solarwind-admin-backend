package com.solarwind.admin.config.security;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class SlwPasswordEncoder implements PasswordEncoder {
  
  @Override
  public String encode(CharSequence plainTextPassword) {
    return plainTextPassword.toString(); // BCrypt.hashpw(plainTextPassword.toString(),BCrypt.gensalt(8));
  }

  @Override
  public boolean matches(CharSequence plainTextPassword, String passwordInDatabase) {
    System.out.println("MATCHES " + plainTextPassword + " " + passwordInDatabase);
    Boolean match = plainTextPassword.toString().equals(passwordInDatabase);
    System.out.println("MATCHES " + match);
    return match;
  }

}
