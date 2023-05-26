package com.members.members.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.members.common.controller.Controller;
import com.members.members.service.MembersService;
import com.members.members.vo.MembersVO;

public class LoginCheckController implements Controller {

	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		
		System.out.println("LoginCheckController서블릿 입니다.");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int status = Integer.parseInt(request.getParameter("status"));

		MembersVO vo = new MembersVO();

		vo.setId(id);
		vo.setPw(pw);
		vo.setStatus(status);
		
		MembersService service = MembersService.getInstance();
		MembersVO loginData = service.login(vo);
		
		HttpSession ssession = request.getSession();
		if (loginData != null) {
			ssession.setAttribute("loginData", loginData);
		} 
		
		int result = service.membersLoginCheck(vo);
		request.setAttribute("resultData", result);
		
	
		return "/common/resultData";
	}
	
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("login") != null) {
			session.invalidate();
			response.sendRedirect("/members/logout.do");
		}
	}*/

}
