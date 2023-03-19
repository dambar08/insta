package com.dambarbahadurpun.insta.repositories;

import com.dambarbahadurpun.insta.models.User;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

}
