package com.solarwind.admin.repository;

import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import com.solarwind.admin.model.Star;

public interface StarRepository extends JpaRepository<Star, UUID> {
}
