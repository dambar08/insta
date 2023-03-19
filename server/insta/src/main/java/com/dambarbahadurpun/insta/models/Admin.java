package com.dambarbahadurpun.insta.models;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
@Entity
@Table(name = "admins")
public class Admin extends ApplicationModel implements UserDetails {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(unique = true, nullable = false)
  private String uuid;

  @Column(unique = true, nullable = false)
  private String username;

  @Column(unique = true, nullable = false)
  private String email;

  @Column(unique = true, nullable = false)
  private String password;

  private String firstName;

  private String lastName;

  // @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
  // @JoinTable(name = "admins_authorities", joinColumns = {
  // @JoinColumn(name = "admins_id", referencedColumnName = "id", nullable =
  // false, updatable = false) }, inverseJoinColumns = {
  // @JoinColumn(name = "authorities_id", referencedColumnName = "id", nullable =
  // false, updatable = false) })
  @ManyToMany
  private Set<Authority> authorities = new HashSet<>();

  @Column(nullable = false)
  private boolean isAccountNonExpired;

  @Column(nullable = false)
  private boolean isAccountNonLocked;

  @Column(nullable = false)
  private boolean isCredentialsNonExpired;

  @Column(nullable = false)
  private boolean isEnabled;

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return this.authorities;
  }

  @Override
  public String getPassword() {
    return this.password;
  }

  @Override
  public String getUsername() {
    return this.username;
  }

  @Override
  public boolean isAccountNonExpired() {
    return this.isAccountNonExpired;
  }

  @Override
  public boolean isAccountNonLocked() {
    return this.isAccountNonLocked;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return this.isCredentialsNonExpired;
  }

  @Override
  public boolean isEnabled() {
    return this.isEnabled;
  }
}
