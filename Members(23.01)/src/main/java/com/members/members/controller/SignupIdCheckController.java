package com.members.members.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.members.common.controller.Controller;
import com.members.members.service.MembersService;

public class SignupIdCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String inputId = request.getParameter("id");
		
		MembersService service = MembersService.getInstance();
		int result = service.signupIdCheck(inputId);
		
		request.setAttribute("resultData", result);
		
		return "/common/resultData";
	}
}
