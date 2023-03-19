package com.example.demo.models;

import java.io.Serializable;

import javax.persistence.*;

import lombok.Data;

@Entity
@Data
@Table(name = "pages")
public class Page implements Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private int number;
  private String content;
  private String chapter;

  @ManyToOne(fetch = FetchType.LAZY, optional = false)
  @JoinColumn(name = "book_id", nullable = false)
  private Book book;

  public Page() {
  }

  public Page(int number, String content, String chapter, Book book) {
    this.number = number;
    this.content = content;
    this.chapter = chapter;
    this.book = book;
  }
}
