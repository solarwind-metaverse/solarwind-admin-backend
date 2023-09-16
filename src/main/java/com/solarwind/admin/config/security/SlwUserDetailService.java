package com.solarwind.admin.config.security;

import org.springframework.stereotype.Service;

import com.solarwind.admin.model.User;
import com.solarwind.admin.repository.UserRepository;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Service
public class SlwUserDetailService implements UserDetailsService {

  @Autowired
  private UserRepository userRepository;
  
  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    
    System.out.println("LOAD USER " + username);
    
    User user = userRepository.findUserByEmail(username)
      .orElseThrow(() -> new UsernameNotFoundException(username));

    if (user.getPassword() == null) {
      user.setPassword("test");
    }

    Set<GrantedAuthority> authorities = Set.of(new SimpleGrantedAuthority("ADMIN"));
    return new org.springframework.security.core.userdetails.User(username, user.getPassword(), authorities);
  
  }
  
}
