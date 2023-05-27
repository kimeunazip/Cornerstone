package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.board.vo.BoardVO;
import com.mvc.common.controller.Controller;

public class ReplyFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("ReplyFormController.java > execute() ");
		
		String num = request.getParameter("num");
		String code = request.getParameter("code");
		
		BoardService service = BoardService.getInstance();
		BoardVO data = service.replyForm(num);
		
		request.setAttribute("reply", data);
		
		if(code != null && code.equals("1")) {
			request.setAttribute("errorMsg", "답글변등록에 문제가 있어 잠시후 다시 시도해주세요.");
		}
		
		return "/board/replyForm";
	}

}
