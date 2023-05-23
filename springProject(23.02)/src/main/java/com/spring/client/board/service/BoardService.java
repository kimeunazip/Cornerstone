package com.spring.client.board.service;

import java.util.List;

import com.spring.client.board.vo.BoardVO;

public interface BoardService {
	
		//게시판 전체조회
		public List<BoardVO> boardList();
		
		//게시판 검색가능한 전체조회
		public List<BoardVO> boardList(BoardVO vo);
				
		//페이징처리한 전체조회
		public List<BoardVO> pagingList(BoardVO vo);
		
		//페이징처리를 위한 전체 데이터 개수
		public int getTotal(BoardVO vo);
		
		//검색 + 페이징처리한 전체조회
		public List<BoardVO> searchPagingList(BoardVO vo);
		
		//게시글 상세조회
		public BoardVO boardDetail(BoardVO vo) throws Exception;
		
		//게시글 등록
		public int boardInsert(BoardVO vo) throws Exception;
		
		//게시글 수정
		public int boardUpdate(BoardVO vo) throws Exception;
		
		//게시글 삭제
		public int boardDelete(BoardVO vo) throws Exception;
		
		//게시글 비밀번호 확인
		public int pwdCheck(BoardVO vo);
		
		//게시글 조회수 증가
		public void updateHit(BoardVO vo);
		
		//게시글 수정화면
		public BoardVO updateForm(BoardVO vo) throws Exception;
		
		//게시글 삭제 전 댓글 갯수
		public int replyCnt(int b_num);
}
