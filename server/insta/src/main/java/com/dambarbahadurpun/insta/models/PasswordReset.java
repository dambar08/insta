package com.dambarbahadurpun.insta.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "password_resets")
public class PasswordReset extends ApplicationModel {

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "user_id", nullable = false)
  private User user;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "token")
  private String token;

  @Column(updatable = false, columnDefinition = "TIMESTAMP", nullable = false)
  private Date createdAt;

  @Column(columnDefinition = "TIMESTAMP", nullable = false)
  private Date updatedAt;

}
