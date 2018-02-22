package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BlogService;
import com.javaex.service.CategoryService;
import com.javaex.service.UserService;
import com.javaex.service.WriteService;
import com.javaex.vo.BlogVo;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.UserVo;
import com.javaex.vo.WriteVo;

@Controller
public class WriteController {
	
	@Autowired
	private UserService userservice;
	@Autowired
	private BlogService blogservice;
	@Autowired
	private CategoryService	categoryservice;
	@Autowired
	private WriteService writeservice;
	
	@RequestMapping(value="{id}/admin/write",method=RequestMethod.GET)
	public String write(@PathVariable("id") String id,
						HttpSession session,
						Model model) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if(authUser == null) {
			return "user/loginForm";
		}
		UserVo uservo = userservice.getUserVoById(id);
		int no = uservo.getUserNo();
		if(authUser.getUserNo() != no) {
			return "error/loginError";
		}
		
		BlogVo blogvo = blogservice.getBlogInfo(no);
		model.addAttribute("blogVo", blogvo);
		
		//모델로 카테고리 목록리스트로 보내기
		List<CategoryVo> categoryList = categoryservice.getCategoryInfo(no);
		model.addAttribute("categoryList", categoryList);
		
		return "blog/admin/blog-admin-write";
	}
	
	@RequestMapping(value="/excution/admin/write",method=RequestMethod.POST)
	public String writeExcution(HttpSession session,
								@RequestParam("category") String category,
								@ModelAttribute WriteVo writevo) {
		System.out.println("/excution/admin/write");
		UserVo authuser = (UserVo) session.getAttribute("authUser");
		int userno = authuser.getUserNo();
		// title , category , content 받아서 (category를 알면 cateNo를 알수있음) 저장
		int cateno = categoryservice.getCategoryInfoOne(category,userno);
		
		writevo.setCateNo(cateno);
		// post테이블에 저장시킨다.
		writeservice.postStore(writevo);
		
		return "redirect:/"+authuser.getId();
	}
}
