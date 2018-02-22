package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.BasicService;
import com.javaex.service.BlogService;
import com.javaex.service.UserService;
import com.javaex.vo.BlogVo;
import com.javaex.vo.FileUploadVo;
import com.javaex.vo.UserVo;

@Controller
public class BasicController {
	
	@Autowired
	private UserService userservice;
	@Autowired
	private BlogService blogservice;
	@Autowired
	private BasicService basicservice;
	
	@RequestMapping(value="{id}/admin/basic",method=RequestMethod.GET)
	public String basic(@PathVariable("id") String id,
						Model model,
						HttpSession session) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if(authUser == null) { //관리페이지는 로그인 안한 사람은 당연히 못본다.
			return "user/loginForm";
		}
		//path 아이디로 userNo를 찾아온다.
		UserVo uservo = userservice.getUserVoById(id);
		int no = uservo.getUserNo();
		if(authUser.getUserNo() != no) { //관리페이지는 로그인을 하였더라도 로그인한 아이디와 (id의 no) 주소의 id(no) 가 같지않으면 올바르지않은 접근이다 본인이여야만
			return "error/loginError";
		}
		
		BlogVo blogvo = blogservice.getBlogInfo(no);
		model.addAttribute("blogVo", blogvo);
		
		return "blog/admin/blog-admin-basic";
	}
	
	@RequestMapping("{id}/admin/basicexcution")
	public String basicexcution(HttpSession session,
								@PathVariable("id") String id,
								@RequestParam(value="logo-file",required=false) MultipartFile file,
								@RequestParam("title") String title) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if(authUser == null) {
			return "user/loginForm";
		}
		UserVo uservo = userservice.getUserVoById(id);
		int no = uservo.getUserNo();
		if(authUser.getUserNo() != no) {
			return "error/loginError";
		}
		int auth_no = authUser.getUserNo();
		
		if(file.isEmpty() ) {
			return "redirect:/"+authUser.getId()+"/admin/basic";
		}else {
			basicservice.updateTitle(title,auth_no);
		}
		
		basicservice.filerestore(file,auth_no);
		
		return "redirect:/"+authUser.getId()+"/admin/basic";
	}
	
}
