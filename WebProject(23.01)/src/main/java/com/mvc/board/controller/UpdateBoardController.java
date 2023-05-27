package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.board.vo.BoardVO;
import com.mvc.common.controller.Controller;

public class UpdateBoardController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String path = null;
		
		String passwd = request.getParameter("passwd");
		if(passwd.isEmpty()) passwd=""; //비밀번호를 수정하지 않았을 때, null말고 빈문자열로 설정
		
		BoardVO vo = new BoardVO();
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		vo.setPasswd(passwd);
		
		BoardService service = BoardService.getInstance();
		boolean result = service.boardUpdate(vo);
		if(result) {
			path = "/board/detailBoard.do?num="+vo.getNum();
		}else{
			path = "/board/updateForm.do?num="+vo.getNum()+"&code=1";
		}
		
		return path;
	}

}
