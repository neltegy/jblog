package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.BlogService;
import com.javaex.service.CategoryService;
import com.javaex.service.UserService;
import com.javaex.vo.BlogVo;
import com.javaex.vo.CategoryVo;
import com.javaex.vo.UserVo;

@Controller
public class CateController {
	
	@Autowired
	private CategoryService categoryservice;
	@Autowired
	private BlogService blogservice;
	@Autowired
	private UserService userservice;
	
	@RequestMapping(value="{id}/admin/category",method=RequestMethod.GET)
	public String cate(@PathVariable("id") String id,
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
		return "blog/admin/blog-admin-cate";
	}
	
	@ResponseBody
	@RequestMapping(value="/excutionList/admin/category",method=RequestMethod.POST)
	public List<CategoryVo> cateListExcution(@RequestParam("page") int page,
							HttpSession session) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int no = authUser.getUserNo();
		
		List<CategoryVo> cateList= categoryservice.getCategoryInfo(no);
		
		//전체카테고리리스에서 글이있는 카테고리 리스트랑 비교해서 cateName이 같다면 글이있는카테고리리스트의 count값을 전체카테고리 리스트의 count에 셋해준다.
		return cateList;
	}
	
	@ResponseBody
	@RequestMapping(value="/excutionAdd/admin/category",method=RequestMethod.POST)
	public CategoryVo cateAddExcution(@RequestBody CategoryVo categoryvo,
										HttpSession session) {
		System.out.println("/excutionAdd/admin/category");
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int no = authUser.getUserNo();
		
		categoryvo.setUserNo(no);
		
		//insert
		categoryservice.categoryStore(categoryvo);
		//select
		CategoryVo return_categoryvo = categoryservice.getCategoryInfoOne(categoryvo.getCateNo());
		
		return return_categoryvo;
	}
	
	@ResponseBody
	@RequestMapping(value="/delete/admin/category",method=RequestMethod.POST)
	public String cateDelete(@RequestParam("cateno") int cateno) {
		categoryservice.removeCategoryVo(cateno);
		return "삭제되었습니다.";
	}
}
