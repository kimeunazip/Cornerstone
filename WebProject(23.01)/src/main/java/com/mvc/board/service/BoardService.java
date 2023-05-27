package com.mvc.board.service;

import java.util.List;

import com.mvc.board.dao.BoardDAO;
import com.mvc.board.vo.BoardVO;

public class BoardService {
	private static BoardService service = null;
	
	private BoardDAO dao = BoardDAO.getInstanece();
	
	private BoardService() {}
	
	public static BoardService getInstance() {
		if(service ==null) {
			service= new BoardService();
		}
		return service;
	}
	
	/* 검색기능 추가 전
	 * public ArrayList<BoardVO> boardList(){ ArrayList<BoardVO> list =
	 * dao.boardList(); return list; }
	 */
	
	public List<BoardVO> boardList(BoardVO vo) {
		List<BoardVO> list = dao.boardList(vo);
		return list;
	}

	public boolean boardInsert(BoardVO vo) {
		
		boolean result = dao.boardInsert(vo);
		return result;
	}

	public BoardVO boardDetail(String num) {

		BoardVO vo = dao.boardDetail(num);
		vo.setContent(vo.getContent().toString().replaceAll("\n", "<br />"));
		return vo;
	}
	
	public void readCount(String num) {
		dao.readCount(num);
	}

	public BoardVO updateForm(String num) {
		BoardVO data = dao.boardDetail(num);
		return data;
	}
	
	public boolean boardUpdate(BoardVO vo) {
		
		boolean result = dao.boardUpdate(vo);
		return result;
	}

	public void boardDelete(String num) {
		dao.boardDelete(num);
	}

	public int boardPasswdCheck(String num, String pw) {
		
		int result = dao.boardPasswdChk(num,pw);
		
		return result;
	}


	public boolean replyInsert(BoardVO vo) {
		boolean result = dao.replyInsert(vo);
		return result;
	}

	public BoardVO replyForm(String num) {
		BoardVO vo = dao.boardDetail(num);
		return vo;
	}

	
}
