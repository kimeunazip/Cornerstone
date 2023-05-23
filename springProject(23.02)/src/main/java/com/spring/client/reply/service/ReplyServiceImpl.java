package com.spring.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.reply.dao.ReplyDAO;
import com.spring.client.reply.vo.ReplyVO;

import lombok.Setter;
@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyDAO replyDao;

	@Override
	public List<ReplyVO> replyList(Integer b_num) {
		List<ReplyVO> list = replyDao.replyList(b_num);
		return list;
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		int result = replyDao.replyInsert(vo);
		return result;
	}

	@Override
	public int checkPwd(ReplyVO vo) {
		int result = replyDao.checkPwd(vo);
		return result;
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		int result = replyDao.replyUpdate(vo);
		return result;
	}

	@Override
	public int replyDelete(Integer r_num) {
		int result = 0;
		result = replyDao.replyDelete(r_num);
		return result;
	}

	
}
