package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.board.vo.BoardVO;
import com.mvc.common.controller.Controller;

public class InsertBoardController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path = null;
		
		BoardVO vo = new BoardVO();
		
		vo.setTitle(request.getParameter("title"));
		vo.setAuthor(request.getParameter("author"));
		vo.setContent(request.getParameter("content"));
		vo.setPasswd(request.getParameter("passwd"));
		
		BoardService service = BoardService.getInstance();
		boolean result = service.boardInsert(vo);

	
		if( result == true) {
			path = "/board/getBoardList.do";
		}else {
			path = "/board/insertForm";
			request.setAttribute("errorMsg", "등록에 문제가 있어 잠시후 다시 입력해 주세요.");
		}
		
		return path;
	}

}
