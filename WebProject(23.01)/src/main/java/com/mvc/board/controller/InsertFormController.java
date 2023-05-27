package com.mvc.board.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.common.controller.Controller;

public class InsertFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("InsertFormController.java > execute() ");
		
		//여기서 로직처리할 건 없다. 입력양식만 보여주면되므로
		
		return "/board/insertForm"; //사용자에게 보여줄 view 정보
	}

}
