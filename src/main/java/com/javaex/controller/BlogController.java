package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
public class BlogController {
	static int store_index;
	
	@Autowired
	private BlogService blogservice;
	@Autowired
	private CategoryService categoryservice;
	@Autowired
	private UserService userservice;
	@Autowired
	private WriteService writeservice;
	
	@RequestMapping(value="{id}",method=RequestMethod.GET)
	public String blog(@PathVariable("id") String id,
						Model model,
						@RequestParam(value="cateNo",required=false, defaultValue="-1") int cateno,
						@RequestParam(value="postNo",required=false, defaultValue="-1") int postno,
						@RequestParam(value="index",required=false, defaultValue="-1") int index) {
		//아이디로 userNo를 찾아온다.
		UserVo uservo = userservice.getUserVoById(id);
		int userno = uservo.getUserNo();
		
		BlogVo blogvo = blogservice.getBlogInfo(userno);
		List<CategoryVo> categoryVoList = categoryservice.getCategoryInfo(userno);
		
		if(cateno == -1) {
			//메인화면에 글뿌려줘야함 post의 최근글 뿌려줌
			List<WriteVo> listOfWriteVo = writeservice.getListOfPostByUserNo(userno); //전체글
			model.addAttribute("listOfWriteVo", listOfWriteVo);
		}else {
			List<WriteVo> listOfWriteVo = writeservice.getListOfPostByCateNo(cateno); //해당 카테고리글
			model.addAttribute("listOfWriteVo", listOfWriteVo);
		}
		
		if(index != -1) {
			store_index = index;
		}
		
		if(postno != -1) { //글을 눌렀을때
			WriteVo WriteVo = writeservice.getPostByPostNo(postno);
			model.addAttribute("WriteVo", WriteVo);
			if(store_index == 0) {
				List<WriteVo> listOfWriteVo = writeservice.getListOfPostByUserNo(userno); //전체글
				model.addAttribute("listOfWriteVo", listOfWriteVo);
			}else if(store_index == 1) {
				List<WriteVo> listOfWriteVo = writeservice.getListOfPostByCateNo(cateno); //해당 카테고리글
				model.addAttribute("listOfWriteVo", listOfWriteVo);
			}
			
		}
		
		model.addAttribute("id",id);
		model.addAttribute("blogVo", blogvo);
		model.addAttribute("categoryVoList", categoryVoList);
		
		
		return "blog/blog-main";
	}
	
	
}
