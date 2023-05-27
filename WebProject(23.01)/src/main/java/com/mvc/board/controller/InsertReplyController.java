package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.board.vo.BoardVO;
import com.mvc.common.controller.Controller;

public class InsertReplyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("InsertReplyController.java > execute() ");
		
			String path="";
			BoardVO vo = new BoardVO();
			System.out.println(request.getParameter("num"));
			vo.setNum(Integer.parseInt(request.getParameter("num")));
			vo.setTitle(request.getParameter("title"));
			vo.setAuthor(request.getParameter("author"));
			vo.setContent(request.getParameter("content"));
			vo.setRepRoot(Integer.parseInt(request.getParameter("repRoot")));
			vo.setRepIndent(Integer.parseInt(request.getParameter("repIndent")));
			vo.setRepStep(Integer.parseInt(request.getParameter("repStep")));
			vo.setPasswd(request.getParameter("passwd"));
			
			BoardService service = BoardService.getInstance();
			boolean result = service.replyInsert(vo);
			
			if(result) 
				path = "/board/getBoardList.do";
			else
				path = "/board/replyForm.do?num"+vo.getNum()+"&code=1";
			
			return path;
	}

}
