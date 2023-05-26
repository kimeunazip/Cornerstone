package com.members.members.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.members.common.controller.Controller;
import com.members.members.service.MembersService;
import com.members.members.vo.MembersVO;

public class SignupMemberController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
			String path= "";
			MembersVO vo = new MembersVO();
			vo.setName(request.getParameter("name"));
			vo.setId(request.getParameter("id"));
			vo.setPw(request.getParameter("pw"));
			vo.setPhone(request.getParameter("phone1")+
						request.getParameter("phone2")+
						request.getParameter("phone3"));
			vo.setEmail(request.getParameter("email"));
			vo.setAddress(request.getParameter("address"));
			
			MembersService service = MembersService.getInstance();
			boolean result = service.membersInsert(vo);
			
			if(result == true ) {
				request.setAttribute("resultMsg", "성공");
				path= "/members/loginForm.do";
			} else {
				request.setAttribute("resultMsg", "실패");
				path= "/members/loginForm.do"; 
			}
			
			return path;
			
	}
}
