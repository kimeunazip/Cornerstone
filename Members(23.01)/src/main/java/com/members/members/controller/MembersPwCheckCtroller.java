package com.members.members.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.members.common.controller.Controller;
import com.members.members.service.MembersService;

public class MembersPwCheckCtroller implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String num = request.getParameter("num");
		String pw = request.getParameter("pw"); 
		
		MembersService service = MembersService.getInstance();
		int result = service.membersPwCheck(num,pw);
		
		request.setAttribute("resultData", result);
		
		return "/common/resultData";
	}

}
