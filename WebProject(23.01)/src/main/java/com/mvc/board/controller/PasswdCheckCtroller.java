package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.common.controller.Controller;

public class PasswdCheckCtroller implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("PasswdCheckCtroller > execute() ");
		
		String num2 = request.getParameter("num2");
		String pw = request.getParameter("pw"); 
		
		BoardService service = BoardService.getInstance();
		int result = service.boardPasswdCheck(num2,pw);
		
		request.setAttribute("resultData", result);
		
		return "/common/resultData";
	}

}
