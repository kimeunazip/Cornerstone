package com.mvc.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.board.vo.BoardVO;
import com.mvc.common.controller.Controller;

public class GetBoardListController implements Controller { //실제 로직처리를 위한 sub controller

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("GetBoardListController.java > execute() ");
		
		BoardService service = BoardService.getInstance();
		
		//검색 기능 추가 전
		//ArrayList<BoardVO> list = service.boardList();
		
		String search = request.getParameter("search");
		
		if(search == null) {
			search = "all";
		}
		
		BoardVO vo = new BoardVO();
		vo.setSearch(search);
		vo.setKeyword(request.getParameter("keyword"));
		System.out.println(vo.getKeyword()+"/"+vo.getSearch());
		List<BoardVO> list =service.boardList(vo);
		
		request.setAttribute("list",list);
		
		return "/board/getBoardList"; //보여줄 문서의 주소 반환,WEB-INF,.jsp는 ViewSolver에서 덧붙혀야한다.
	}
}
