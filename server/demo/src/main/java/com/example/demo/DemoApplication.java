package com.example.demo;

import java.util.Arrays;

import com.example.demo.models.Book;
import com.example.demo.models.Course;
import com.example.demo.models.Page;
import com.example.demo.models.Student;
import com.example.demo.models.StudentRole;
import com.example.demo.repositories.BookRepository;
import com.example.demo.repositories.CourseRepository;
import com.example.demo.repositories.PageRepository;
import com.example.demo.repositories.StudentRepository;
import com.example.demo.repositories.StudentRoleRepository;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import de.codecentric.boot.admin.server.config.EnableAdminServer;

@SpringBootApplication
@EnableAdminServer
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

	@Bean
	public CommandLineRunner runner(StudentRepository studentRepository, CourseRepository courseRepository,
			StudentRoleRepository studentRoleRepository, BookRepository bookRepository, PageRepository pageRepository) {
		return new CommandLineRunner() {
			@Override
			public void run(String... args) {
				Student s1 = new Student("Student1", 10, "3.6");
				Student s2 = new Student("Student2", 20, "3.6");
				Student s3 = new Student("Student3", 30, "3.6");

				studentRepository.save(s1);
				studentRepository.save(s2);
				studentRepository.save(s3);

				Course c1 = new Course("Computer Science", "CS", 101, 10000);
				Course c2 = new Course("Data Structure", "DS", 102, 20000);
				Course c3 = new Course("Applied Mathematics", "AM", 102, 80000);

				StudentRole sr1 = new StudentRole("Captain");
				StudentRole sr2 = new StudentRole("Vice captain");

				studentRoleRepository.saveAll(Arrays.asList(sr1, sr2));

				courseRepository.saveAll(Arrays.asList(c1, c2, c3));

				s1.getCourses().addAll(Arrays.asList(c1, c2));
				s2.getCourses().addAll(Arrays.asList(c1));
				s1.setStudentRole(sr1);
				s2.setStudentRole(sr2);
				s3.setStudentRole(sr1);

				// create a new book
				Book book = new Book("Java 101", "John Doe", "123456");

				// save the book
				bookRepository.save(book);

				// create and save new pages
				pageRepository.save(new Page(1, "Introduction contents", "Introduction", book));
				pageRepository.save(new Page(65, "Java 8 contents", "Java 8", book));
				pageRepository.save(new Page(95, "Concurrency contents", "Concurrency", book));
				studentRepository.saveAll(Arrays.asList(s1, s2, s3));

				System.out.println(s1.getCourses());

			}
		};
	}

}
