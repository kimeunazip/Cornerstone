package com.spring.client.reply.service;

import java.util.List;

import com.spring.client.reply.vo.ReplyVO;

public interface ReplyService {
	
	//댓글조회
	public List<ReplyVO> replyList(Integer b_num);
	
	//댓글등록
	public int replyInsert(ReplyVO vo);
	
	//비밀번호 확인
	public int checkPwd(ReplyVO vo);
	
	//댓글수정
	public int replyUpdate(ReplyVO vo);
	
	//댓글삭제
	public int replyDelete(Integer r_num);
	
}
