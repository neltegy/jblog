package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CategoryVo;
import com.javaex.vo.UserVo;

@Repository
public class CategoryDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public void insertCategoryVo(UserVo uservo) {
		
		sqlsession.insert("category.insertCategoryVo", uservo);
	}
	
	public List<CategoryVo> selectCategoryVo(int no){
		
		return sqlsession.selectList("category.selectCategoryVo", no);
	}
	
	public void insertBasicCategoryVo(CategoryVo categoryvo) {
		
		sqlsession.insert("category.insertBasicCategoryVo", categoryvo);
	}
	
	public CategoryVo selectCategoryVoOne(int no) {
		
		return sqlsession.selectOne("category.selectCategoryVoOneByNo", no);
	}

	public int selectCategoryVoOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("category.selectCategoryVoOneByNoAndName", map);
	}
	
}
