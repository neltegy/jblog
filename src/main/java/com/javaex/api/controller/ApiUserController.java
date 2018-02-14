package com.javaex.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;

@Controller
@RequestMapping("/user")
public class ApiUserController {
	
	@Autowired
	private UserService userservice;
	
	@ResponseBody
	@RequestMapping(value="/api/join",method=RequestMethod.POST)
	public int join(@RequestParam("id") String id) {
		System.out.println("/api/join");
		
		int fail = userservice.getid(id);
		
		return fail;
	}
	
}
