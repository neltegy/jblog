package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public String selectIdById(String id) {
		
		return sqlsession.selectOne("user.selectUserIdById", id);
	}
	
}
