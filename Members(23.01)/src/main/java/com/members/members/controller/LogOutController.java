package com.members.members.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.members.common.controller.Controller;


public class LogOutController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		
		 HttpSession session = request.getSession(false);
		    if (session != null) {
		        session.invalidate();
		    }
		
		return "/members/loginForm.do";
	}

}
