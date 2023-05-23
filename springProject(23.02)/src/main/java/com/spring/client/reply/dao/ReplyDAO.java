package com.spring.client.reply.dao;

import java.util.List;

import com.spring.client.reply.vo.ReplyVO;

public interface ReplyDAO {
	
	//댓글목록
	public List<ReplyVO> replyList(Integer b_num);
	
	//댓글등록
	public int replyInsert(ReplyVO vo);
	
	//비밀번호 확인
	public int checkPwd(ReplyVO vo);
	
	//댓글수정
	public int replyUpdate(ReplyVO vo);
	
	//댓글삭제
	public int replyDelete(Integer r_num);
	
	//호출은 보드쪽에서 하지만 mapping은 여기서 할 수도 있다.
	public int replyCnt(int b_num);
}
