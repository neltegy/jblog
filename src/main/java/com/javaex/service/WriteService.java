package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.WriteDao;
import com.javaex.vo.WriteVo;

@Service
public class WriteService {
	
	@Autowired
	private WriteDao writedao;
	
	public void postStore(WriteVo writevo) {
		
		writedao.insertWriteVo(writevo);
	}
	
	public List<WriteVo> getListOfPostByUserNo(int userno){
		
		return writedao.selectListOfPostByUserNo(userno);
	}
	
	public List<WriteVo> getListOfPostByCateNo(int cateno){
		
		return writedao.selectListOfPostByCateNo(cateno);
	}
	
	public WriteVo getPostByPostNo(int postno) {
		
		return writedao.selectPostByPostNo(postno);
	}
}
