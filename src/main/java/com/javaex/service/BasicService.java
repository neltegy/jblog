package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.BasicDao;
import com.javaex.vo.FileUploadVo;

@Service
public class BasicService {
	@Autowired
	private BasicDao basicdao;
	
	public void updateTitle(String title,int no) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("title", title);
		map.put("no", no);
		
		basicdao.updateBlogTitle(map);
	}
	
	public void filerestore(MultipartFile file,int no) {
		String saveDir = "D:\\javaStudy\\upload";
		
		//파일정보수집
		
		//원파일이름
		String orgName = file.getOriginalFilename();
		System.out.println("orgName:"+orgName);
		//확장자
		String exName = orgName.substring(file.getOriginalFilename().lastIndexOf("."));
		System.out.println("exName:"+exName);
		//저장파일이름
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		System.out.println("saveName:"+saveName);
		//파일패스
		String filePath = saveDir + "\\" + saveName;
		System.out.println("filePath:"+filePath);
		//파일사이즈
		long fileSize = file.getSize();
		System.out.println("fileSize:"+fileSize);
		
		//vo를 만들어서 dao 통해서 저장
		FileUploadVo fileuploadvo = new FileUploadVo();
		fileuploadvo.setOrgname(orgName);
		fileuploadvo.setExname(exName);
		fileuploadvo.setSavename(saveName);
		fileuploadvo.setFilepath(filePath);
		fileuploadvo.setFilesize(fileSize);
		
		basicdao.insertFileInfo(fileuploadvo); //5개의 정보만담겨져있음
		//인제 6개됨
		FileUploadVo getfileuploadvo = basicdao.selectFileInfo(fileuploadvo.getNo()); //내가방금 올린파일
		
		String path = "/jblog/upload/"+saveName;
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("no", no);
		map.put("path", path);
		basicdao.updateLogoFile(map);
		
		//파일 카피
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(saveDir + "/" + saveName);
			BufferedOutputStream bout = new BufferedOutputStream(out);
			
			bout.write(fileData);
			
			if(bout != null) {
				bout.close();
			}
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
}
