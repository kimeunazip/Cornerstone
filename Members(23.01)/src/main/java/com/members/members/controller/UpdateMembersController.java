package com.members.members.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.members.common.controller.Controller;
import com.members.members.service.MembersService;
import com.members.members.vo.MembersVO;

public class UpdateMembersController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("UpdateMembersController서블릿의 execute메서드 입니다. ");
		
		MembersVO vo = new MembersVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")) );
		vo.setPw(request.getParameter("pw"));
		vo.setPhone(request.getParameter("phone"));
		vo.setEmail(request.getParameter("email"));
		vo.setAddress(request.getParameter("address"));
		
		System.out.println("test"+vo.toString());
		
		MembersService service = MembersService.getInstance();
		int result = service.membersUpdate(vo);
		
		request.setAttribute("resultData", result);
		
		return "/common/resultData";
	}

}
