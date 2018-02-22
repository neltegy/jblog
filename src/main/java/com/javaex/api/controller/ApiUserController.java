package com.javaex.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

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
	
	@ResponseBody
	@RequestMapping(value="/api/login",method=RequestMethod.POST)
	public int login(@RequestBody UserVo uservo) {
		int fail;
		
		UserVo return_uservo = userservice.loginUser(uservo);
		if(return_uservo == null) {
			fail = 0;
		}else {
			fail = 1;
		}
		return fail;
	}
	
}
