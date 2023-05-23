package com.spring.client.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.board.dao.BoardDAO;
import com.spring.client.board.vo.BoardVO;
import com.spring.client.reply.dao.ReplyDAO;
import com.spring.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService { 

	@Setter(onMethod_ = @Autowired)
	private BoardDAO boardDao;
	
	//다른 dao에 접근하고싶으면 필드만 만들어주면된다.
	
	@Setter(onMethod_ = @Autowired)
	private ReplyDAO replyDao;
	
	@Override
	public List<BoardVO> boardList() {
		List<BoardVO> list = boardDao.boardList();
		return list;
	}

	@Override
	public List<BoardVO> boardList(BoardVO vo) {
		List<BoardVO> list = boardDao.boardList();
		return list;
	}


	 @Override public List<BoardVO> pagingList(BoardVO vo) { 
		 List<BoardVO>pagingList = boardDao.pagingList(vo); 
		 return pagingList; 
	 }
	
	
	@Override
	public int getTotal(BoardVO vo) {
		int total = boardDao.getTotal(vo);
		return total;
	}

	@Override
	public List<BoardVO> searchPagingList(BoardVO vo) {
		List<BoardVO> searchPagingList = boardDao.searchPagingList(vo);
		return searchPagingList;
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
	public int boardInsert(BoardVO vo) throws Exception{
		int result = 0;
		//test용 예외
		/*
		vo.setB_num(0);
		if(vo.getB_num() ==0) {
			throw new IllegalArgumentException("0번글은 없어!");
		}
		*/
		
		if(vo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(vo.getFile(), "board");
			vo.setB_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			vo.setB_thumb(thumbName);
		}
		result = boardDao.boardInsert(vo);
		return result;
	}

	@Override
	public int boardUpdate(BoardVO vo) throws Exception {
		int result = boardDao.boardUpdate(vo);
		return result;
	}

	@Override
	public int boardDelete(BoardVO vo) throws Exception {
		int result = 0;
		
		if(!vo.getB_file().isEmpty()) {
			FileUploadUtil.fileDelete(vo.getB_file());
			FileUploadUtil.fileDelete(vo.getB_thumb());
		}
		result = boardDao.boardDelete(vo);
		return result;
	}

	@Override
	public int pwdCheck(BoardVO vo) {
		
		int result = boardDao.pwdCheck(vo);
		return result;
	}

	@Override
	public void updateHit(BoardVO vo) {
		boardDao.updateHit(vo);
	}

	@Override
	public BoardVO updateForm(BoardVO vo) throws Exception {
		BoardVO bvo = boardDao.boardDetail(vo);
		return bvo;
	}

	@Override
	public int replyCnt(int b_num) {
		int result = 0; 
		result = replyDao.replyCnt(b_num);
		return result;
	}
}