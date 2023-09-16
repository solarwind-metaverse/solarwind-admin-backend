package com.solarwind.admin.repository;

import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import com.solarwind.admin.model.User;

public interface UserRepository extends JpaRepository<User, UUID> {
  
  Optional<User> findUserByEmail(String email);
  
}
