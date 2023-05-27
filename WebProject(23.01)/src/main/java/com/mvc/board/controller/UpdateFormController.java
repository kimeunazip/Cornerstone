package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.board.vo.BoardVO;
import com.mvc.common.controller.Controller;

public class UpdateFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UpdateFormController.java > execute() ");
		System.out.println(request.getParameter("num"));
		
		String num = request.getParameter("num");
		String code = request.getParameter("code");
		
		BoardService service = BoardService.getInstance();
		BoardVO data = service.updateForm(num);
		
		request.setAttribute("updateData", data);
		
		if(code != null && code.equals("1")) {
			request.setAttribute("errorMsg", "수정에 문제가 있어 잠시후 다시 시도해주세요.");
		}
		return "/board/updateForm";
		
	}

}
