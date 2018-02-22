package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.WriteVo;

@Repository
public class WriteDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public void insertWriteVo(WriteVo writevo) {
		
		sqlsession.insert("write.insertWriteVo", writevo);
	}
	
	public List<WriteVo> selectListOfPostByUserNo(int userno){
		
		return sqlsession.selectList("write.selectListOfPostByUserNo",userno);
	}
	
	public List<WriteVo> selectListOfPostByCateNo(int cateno){
		
		return sqlsession.selectList("write.selectListOfPostByCateNo", cateno);
	}
	
	public WriteVo selectPostByPostNo(int postno) {
		
		return sqlsession.selectOne("write.selectPostByPostNo", postno);
	}
}
