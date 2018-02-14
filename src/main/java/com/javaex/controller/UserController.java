package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userservice;
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		
		return "user/joinForm";
	}
	
	@RequestMapping(value="/joinexecution",method=RequestMethod.POST)
	public String joinexecution(@ModelAttribute UserVo uservo) { //vo에 없는 데이터가 보내졌을때 오류가 나지않는다.
		
		userservice.storeUserInfo(uservo);
		
		return "user/joinSuccess";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		
		return "user/loginForm";
	}
	
	@RequestMapping(value="/loginexecution",method=RequestMethod.POST)
	public String loginexecution(@ModelAttribute UserVo uservo,
									HttpSession session) {
		
		UserVo authUser = userservice.loginUser(uservo);
		session.setAttribute("authUser", authUser);
		
		return "blog/blog-main";
	}
	
}
