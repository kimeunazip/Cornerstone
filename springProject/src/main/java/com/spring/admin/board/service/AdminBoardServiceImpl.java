package com.spring.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.board.dao.BoardDAO;
import com.spring.client.board.vo.BoardVO;
import com.spring.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardDAO boardDao;

	@Override
	public List<BoardVO> boardList(BoardVO vo) {
		List<BoardVO> aList = null;
		aList = boardDao.searchPagingList(vo);
		return aList;
	}

	@Override
	public int boardListCnt(BoardVO vo) {
		int countNum = 0;
		countNum = boardDao.getTotal(vo);
		return countNum;
	}

	@Override
	public BoardVO boardDetail(BoardVO vo) throws Exception{
		
		BoardVO bvo = boardDao.boardDetail(vo);
		if(bvo != null) {
			bvo.setB_content(bvo.getB_content().toString().replaceAll("\n", "<br />"));
		}
		return bvo;
	}

	@Override
	public int boardDelete(BoardVO vo) throws Exception {
		
		int result = 0;
		
		/*
		 * if(!vo.getB_file().isEmpty()) { FileUploadUtil.fileDelete(vo.getB_file());
		 * FileUploadUtil.fileDelete(vo.getB_thumb()); }
		 */
		result = boardDao.boardDelete(vo);
		return result;
	}
	
	
	
	
}
