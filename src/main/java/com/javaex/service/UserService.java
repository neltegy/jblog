package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;

@Service
public class UserService {
	
	@Autowired
	private UserDao userdao;
	
	public int getid(String id) {
		System.out.println("userservice");
		int fail = 2;
		String return_id = userdao.selectIdById(id);
		
		if(return_id == null) { //아이디가 없을때
			fail = 0;
		}else { //아이디가 있을때 (아이디사용에 실패했기때문에 fail에 1을줌)
			fail = 1;
		}
		
		return fail;
	}
	
}
