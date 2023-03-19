package com.dambarbahadurpun.insta.configurations;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.config.BootstrapMode;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableJpaRepositories(bootstrapMode = BootstrapMode.LAZY)
@EnableTransactionManagement
public class ApplicationConfig {

}
