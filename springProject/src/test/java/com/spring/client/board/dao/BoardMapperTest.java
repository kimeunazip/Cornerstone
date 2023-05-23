package com.spring.client.board.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.board.vo.BoardVO;
import com.spring.client.board.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Setter(onMethod_ = @Autowired)
	private BoardDAO boardDao;
	
	/*
	//게시판 전체조회
	@Test
	public void testBoardList() {

		log.info("-------------------------------------");
		log.info("testBoardList() 메서드 실행 ");
		
		List<BoardVO> list = boardDao.boardList();
		
		for(BoardVO vo: list ) {
			log.info(vo.toString());
		}
		
		log.info("-------------------------------------");
		
	}
	*/
	/*
	//게시판 전체조회
		@Test
		public void testBoardInsert() {

			log.info("-------------------------------------");
			log.info("testBoardInsert() 메서드 실행 ");
			
			BoardVO vo = new BoardVO();
			vo.setB_name("이름TEST");
			vo.setB_title("제목TEST");
			vo.setB_content("내용TEST");
			vo.setB_pwd("1234TEST");
			
			int result = boardDao.boardInsert(vo);
			
			log.info("testBoardInsert() 메서드 실행 결과 :  "+result);
			log.info("-------------------------------------");
			
		}
	*/
	/*
	@Test
	public void testBoardDetail() {

		log.info("-------------------------------------");
		log.info("testBoardDetail() 메서드 실행 ");
		
		BoardVO vo = new BoardVO();
		vo.setB_num(1);
		
		int result = boardDao.boardInsert(vo);
		
		log.info("testBoardInsert() 메서드 실행 결과 :  "+result);
		log.info("-------------------------------------");
		
	}
	*/
	/*
	@Test
	public void testPagingList() {

		log.info("-------------------------------------");
		log.info("testPagingList() 메서드 실행 ");
		Criteria c = new Criteria();
		c.setPageNum(2);
		List<BoardVO> list = boardDao.pagingList(c);
		
		for(BoardVO vo: list ) {
			log.info(vo.toString());
		}
		
		
		log.info("-------------------------------------");
		
	}*/
	
	@Test
	public void testSearchableList() {

		log.info("-------------------------------------");
		log.info("testSearchableList() 메서드 실행 ");
		
		BoardVO vo = new BoardVO();
		vo.setKeyword("The");
		vo.setSearch("b_title");
		
		List<BoardVO> list2 = boardDao.searchPagingList(vo);
		for(BoardVO bvo: list2 ) {
			log.info(bvo.toString());
			log.info(bvo.getPageNum());
		}
		
		int total = boardDao.getTotal(vo);
		log.info(total);
		
		PageDTO pageDto  = new PageDTO(vo,total);
		log.info(pageDto);
		
		
		log.info("-------------------------------------");
		
	}
}
