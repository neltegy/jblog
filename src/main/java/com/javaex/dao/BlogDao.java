package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BlogVo;
import com.javaex.vo.UserVo;

@Repository
public class BlogDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public void insertBlogVo(UserVo uservo) {
		
		sqlsession.insert("blog.insertBlogVo", uservo);
	}
	
	public BlogVo selectBlogVo(int no) {
		
		return sqlsession.selectOne("blog.selectBlogVo", no);
	}
}
