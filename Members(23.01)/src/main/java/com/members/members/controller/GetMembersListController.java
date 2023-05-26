package com.members.members.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.members.common.controller.Controller;
import com.members.members.service.MembersService;
import com.members.members.vo.MembersVO;


public class GetMembersListController implements Controller {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("GetMembersListController서블릿입니다.");
		
		MembersService service = MembersService.getInstance();
		ArrayList<MembersVO> list = service.membersList();
		
		for(MembersVO vo : list) {
			System.out.println(vo.toString());
		}
		
		request.setAttribute("list", list);
		
		return "/members/getMembersList";
	}
}
