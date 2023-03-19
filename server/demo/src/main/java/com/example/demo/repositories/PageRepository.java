package com.example.demo.repositories;

import com.example.demo.models.Page;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PageRepository extends JpaRepository<Page, Long> {

}
