package com.dambarbahadurpun.insta.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Getter;
import lombok.Setter;
import lombok.AccessLevel;

@Getter(AccessLevel.PROTECTED)
@Setter(AccessLevel.PROTECTED)
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)

public class ApplicationModel {
  @CreatedDate
  @Column(name = "created_date", nullable = false)
  private Date createdAt;

  @LastModifiedDate
  @Column(name = "last_modified_date", nullable = false)
  private Date lastModifiedDate;
}
