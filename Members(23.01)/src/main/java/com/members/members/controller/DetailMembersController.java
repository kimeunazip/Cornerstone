package com.members.members.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.members.common.controller.Controller;
import com.members.members.service.MembersService;
import com.members.members.vo.MembersVO;

public class DetailMembersController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("DetailMembersController서블릿의 execute메서드 입니다. ");
		
		String num = request.getParameter("num");

		MembersService service = MembersService.getInstance();
		MembersVO detailData = service.membersDetail(num);
		
		HttpSession ssession = request.getSession();
		
		if (detailData != null) {
			ssession.setAttribute("detailData", detailData);
			System.out.println("로그인 계정 : " + detailData.toString());
		} 
		
		return "/members/detailMembers";
	}

}
