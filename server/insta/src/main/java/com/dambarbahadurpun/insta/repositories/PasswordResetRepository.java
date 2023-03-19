package com.dambarbahadurpun.insta.repositories;

import com.dambarbahadurpun.insta.models.PasswordReset;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PasswordResetRepository extends JpaRepository<PasswordReset, Long> {

}
