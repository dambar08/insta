package com.dambarbahadurpun.insta.controllers.auth;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PasswordResetController {

  @PostMapping("/accounts/password/reset")
  public void resetPassword() {
  }

}
