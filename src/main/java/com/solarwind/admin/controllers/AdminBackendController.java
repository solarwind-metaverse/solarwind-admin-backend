package com.solarwind.admin.controllers;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.solarwind.admin.model.Star;
import com.solarwind.admin.repository.StarRepository;

@RestController
@RequestMapping("/api")
public class AdminBackendController {

  @Autowired
  private StarRepository starRepository;

  @GetMapping("/status")
  public String getStatus() {
      return "OK";
  }

  @GetMapping("/stars")
  public List<Star> getStars() {
    List<Star> stars = starRepository.findAll();
    return stars;
  }

  @GetMapping("/stars/{id}")
  public Star getStar(@PathVariable("id") String id) {
    Optional<Star> star = starRepository.findById(UUID.fromString(id));
    return star.orElse(null);
  }

}

