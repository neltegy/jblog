package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public String selectIdById(String id) {
		
		return sqlsession.selectOne("user.selectUserIdById", id);
	}
	
	public void insertUserVo(UserVo uservo) {
		
		sqlsession.insert("user.insertUserVo", uservo);
	}
	
	public UserVo selectUserVo(UserVo uservo) {
		
		return sqlsession.selectOne("user.selectUserVoByIdPassword", uservo);
	}
	
}
