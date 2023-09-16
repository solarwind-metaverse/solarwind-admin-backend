package com.solarwind.admin.repository;

import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import com.solarwind.admin.model.Ship;

public interface ShipRepository extends JpaRepository<Ship, UUID> {
}
