package com.members.members.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.members.common.controller.Controller;
import com.members.members.service.MembersService;
import com.members.members.vo.MembersVO;

public class UnregisterFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("UnregisterFormController서블릿의 execute메서드 입니다. ");

		String num = request.getParameter("num");
		
		MembersService service = MembersService.getInstance();
		MembersVO deleteData = service.membersDetail(num);
		
		HttpSession ssession = request.getSession();
		
		if (deleteData != null) {
			ssession.setAttribute("deleteData", deleteData);
			System.out.println("탈퇴할 계정 : " + deleteData.toString());
		} 
		
		return "/members/unregisterForm";
	}

}
