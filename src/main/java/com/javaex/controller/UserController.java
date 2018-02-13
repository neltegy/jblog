package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		System.out.println("/join");
		return "user/joinForm";
	}
	
	@RequestMapping(value="/joinsuccess",method=RequestMethod.GET)
	public String joinsuccess() {
		System.out.println("/joinsuccess");
		return "user/joinSuccess";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		System.out.println("/login");
		return "user/loginForm";
	}
}
