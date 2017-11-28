package com.boraji.tutorial.springboot.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Controller

public class HelloController {

   @RequestMapping("/")
   public String index() {
      return "index";
   }

   @PostMapping("/hello")
   public String sayHello(@RequestParam("name") String name, Model model) {
      model.addAttribute("name", name);
      return "hello";
   }
  
   @RequestMapping("/lookByhi")
	public ResponseEntity<String> hi(@RequestParam(value = "all", required = false) String all) {
	
		String response = "we had an auditor cam ethis morning and he asked for the reports and we have provided him with the following details for user role changes Here is the link for the requested details: http://www.google.com and for sap Standard profile Here is the link for the requested details: http://www.google.com .He have some questions regarding them and he wants to talk to you";
		

		System.out.println("all are done has been done......");
		
		

		return new ResponseEntity<String>(response, HttpStatus.OK);
	}

	
}
