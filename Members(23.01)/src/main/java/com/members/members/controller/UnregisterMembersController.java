package com.members.members.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.members.common.controller.Controller;
import com.members.members.service.MembersService;

public class UnregisterMembersController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("UnregisterMembersController서블릿의 execute메서드 입니다. ");

		String num = request.getParameter("num");
		
		MembersService service = MembersService.getInstance();
		
		service.membersDelete(num);
		
		return "/members/loginForm";
	}

}
