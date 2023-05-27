package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.board.vo.BoardVO;
import com.mvc.common.controller.Controller;

public class DetailBoardController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String num = request.getParameter("num");
		
		
		BoardService service = BoardService.getInstance();
		
		//1.조회수 증가처리
		service.readCount(num);
		
		//2.해당 글의 vo객체를 data에 담는다.
		BoardVO data = service.boardDetail(num);
		request.setAttribute("detail", data);
		
		System.out.println(data.toString());
		return "/board/detailBoard";
	}

}
