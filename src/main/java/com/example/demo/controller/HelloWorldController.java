package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path="/api/v1/hello")
public class HelloWorldController {
	
	@GetMapping
	public String sayHelloWorld() {
		return "Hello World from Spring Boot application";
	}

}
