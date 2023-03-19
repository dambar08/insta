package com.example.demo.models;

import java.io.Serializable;
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
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "students")
public class Student implements Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private String name;
  private int age;
  private String grade;

  @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
  // @JoinTable(name = "students_courses", joinColumns = {
  // @JoinColumn(name = "student_id", referencedColumnName = "id", nullable =
  // false, updatable = false) }, inverseJoinColumns = {
  // @JoinColumn(name = "course_id", referencedColumnName = "id", nullable =
  // false, updatable = false) })
  private Set<Course> courses = new HashSet<>();

  // @ManyToOne(targetEntity = StudentRole.class, fetch = FetchType.LAZY, cascade
  // = CascadeType.PERSIST)
  // @JoinColumn(name = "student_id")
  // private StudentRole studentRole;
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "student_role_id")
  private StudentRole studentRole;

  public Student() {
  }

  public Student(String name, int age, String grade) {
    this.name = name;
    this.age = age;
    this.grade = grade;
  }

}
