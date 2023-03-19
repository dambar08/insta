package com.example.demo.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "student_roles")
@NoArgsConstructor
public class StudentRole implements Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private String name;

  public StudentRole(String name) {
    this.name = name;
  }

  @OneToMany(mappedBy = "studentRole", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  private Set<Student> students;

  // @OneToMany(mappedBy = "student_role", fetch = FetchType.LAZY, cascade =
  // CascadeType.ALL)
  // private Set<Student> students;

}
