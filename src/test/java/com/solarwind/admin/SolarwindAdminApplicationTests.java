package com.solarwind.admin;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.solarwind.admin.model.Ship;
import com.solarwind.admin.model.User;
import com.solarwind.admin.repository.ShipRepository;
import com.solarwind.admin.repository.UserRepository;

@SpringBootTest
class SolarwindAdminApplicationTests {

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private ShipRepository shipRepository;
  
	@Test
	void contextLoads() {
	}

  @Test
  void testUserFindByEmail() {
    Optional<User> user = userRepository.findUserByEmail("vhalme@gmail.com");
    assertTrue(user.isPresent());
    assertEquals("0xC9A1e74EC287e2216e9E6951Bd808d8741712c61", user.get().getAddress());
  }

  /*
  @Test
  void testFindAllShips() {
    List<Ship> ships = shipRepository.findAll();
    assertTrue(ships.size() > 0);
    Double shipHealth = ships.get(0).getHealth();
    assertTrue(shipHealth > 0 && shipHealth < 101);
  }
  */

}
