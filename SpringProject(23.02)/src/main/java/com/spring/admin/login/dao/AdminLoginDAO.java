package com.spring.admin.login.dao;

import com.spring.admin.login.vo.AdminLoginVO;

public interface AdminLoginDAO {
	
	//로그인처리
	public AdminLoginVO loginProcess(AdminLoginVO login);
	
}
