package com.dambarbahadurpun.insta;

import com.dambarbahadurpun.insta.models.User;
import com.dambarbahadurpun.insta.repositories.RoleRepository;
import com.dambarbahadurpun.insta.repositories.UserRepository;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

// import de.codecentric.boot.admin.server.config.EnableAdminServer;

@SpringBootApplication
// @EnableAdminServer
public class InstaApplication {

	public static void main(String[] args) {
		SpringApplication.run(InstaApplication.class, args);
	}

	// @Bean
	// public CommandLineRunner mappingDemo(UserRepository userRepository,
	// RoleRepository roleRepository) {
	// return args -> {
	// create a student
	// User user = new User();

	// // save the student
	// studentRepository.save(student);

	// // create three courses
	// Course course1 = new Course("Machine Learning", "ML", 12, 1500);
	// Course course2 = new Course("Database Systems", "DS", 8, 800);
	// Course course3 = new Course("Web Basics", "WB", 10, 0);

	// // save courses
	// courseRepository.saveAll(Arrays.asList(course1, course2, course3));

	// // add courses to the student
	// student.getCourses().addAll(Arrays.asList(course1, course2, course3));

	// // update the student
	// studentRepository.save(student);
	// };
	// }

}
