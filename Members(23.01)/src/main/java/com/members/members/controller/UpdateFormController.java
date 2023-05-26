package com.members.members.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.members.common.controller.Controller;
import com.members.members.service.MembersService;
import com.members.members.vo.MembersVO;

public class UpdateFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UpdateFormController서블릿의 execute메서드 입니다. ");

		String num = request.getParameter("num");
		
		MembersService service = MembersService.getInstance();
		MembersVO updateData = service.membersDetail(num);
		
		HttpSession ssession = request.getSession();
		
		if (updateData != null) {
			ssession.setAttribute("updateData", updateData);
			System.out.println("로그인 계정 : " + updateData.toString());
		} 
		
		return "/members/updateForm";
	}

}
