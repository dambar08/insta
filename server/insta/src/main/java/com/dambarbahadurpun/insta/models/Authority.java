package com.dambarbahadurpun.insta.models;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

import lombok.Data;

@Data
@Entity
@Table(name = "authorities")
public class Authority extends ApplicationModel implements GrantedAuthority {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(nullable = false, updatable = false, unique = true)
  private String name;

  @ManyToMany(mappedBy = "authorities", fetch = FetchType.LAZY)
  private Set<Admin> admins = new HashSet<>();

  @Override
  public String getAuthority() {
    return this.name;
  }
}
