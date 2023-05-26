package com.members.members.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.members.common.controller.Controller;

public class AdminLoginFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	
		System.out.println("AdminLoginFormController서블릿 입니다.");
		
		return "/members/adminLoginForm";

	}

}
