package com.spring.admin.login.service;

import com.spring.admin.login.vo.AdminLoginVO;

public interface AdminLoginService {
	
	//로그인처리
	public AdminLoginVO loginProcess(AdminLoginVO login);
		
}
