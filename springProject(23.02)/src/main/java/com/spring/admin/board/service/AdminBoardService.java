package com.spring.admin.board.service;

import java.util.List;

import com.spring.client.board.vo.BoardVO;

public interface AdminBoardService {
	
	public List<BoardVO> boardList(BoardVO vo);
	public int boardListCnt(BoardVO vo);
	public BoardVO boardDetail(BoardVO vo)throws Exception;
	public int boardDelete(BoardVO vo)throws Exception;
}
