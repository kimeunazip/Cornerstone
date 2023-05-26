package com.members.members.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.members.common.controller.Controller;

public class SignupFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		return "/members/signUpForm";
	}

}
