package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CategoryDao;
import com.javaex.vo.CategoryVo;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDao categorydao;
	
	public List<CategoryVo> getCategoryInfo(int no) {
		
		return categorydao.selectCategoryVo(no); 
	}
	
	public void categoryStore(CategoryVo categoryvo) {
		
		categorydao.insertBasicCategoryVo(categoryvo);
	}
	
	public CategoryVo getCategoryInfoOne(int no) {
		
		return categorydao.selectCategoryVoOne(no);
	}

	public int getCategoryInfoOne(String catename,int userno) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("catename", catename);
		map.put("userno", userno);
		return categorydao.selectCategoryVoOne(map);
	}
}
