package com.javaex.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.FileUploadVo;

@Repository
public class BasicDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public void updateBlogTitle(Map<String , Object> map) {
		
		sqlsession.update("blog.updateBlogTitle", map);
	}
	
	public void insertFileInfo(FileUploadVo fileuploadvo) {
		
		sqlsession.insert("fileupload.insertFileInfo", fileuploadvo);
	}

	public FileUploadVo selectFileInfo(int no) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("fileupload.selectFileInfoByNo", no);
	}
	
	public void updateLogoFile(Map<String, Object> map) {
		
		sqlsession.update("blog.updateBlogLogoFile", map);
	}
	
}
