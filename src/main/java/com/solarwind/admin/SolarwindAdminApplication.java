package com.solarwind.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SolarwindAdminApplication {

	public static void main(String[] args) {
		SpringApplication.run(SolarwindAdminApplication.class, args);
	}

}
