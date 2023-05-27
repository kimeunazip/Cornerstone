package com.spring.client.members.dao;

import java.util.List;

import com.spring.client.members.vo.MembersVO;

public interface MembersDAO {
	
	//회원가입
	public int signUp(MembersVO vo);

	//로그인 처리
	public MembersVO logIn(MembersVO vo);
	
	//회원 리스트
	public List<MembersVO> membersList();
	
	//회원정보 상세조회
	public MembersVO membersDetail(MembersVO vo);
	
	//회원정보 수정
	public int membersUpdate(MembersVO vo);
	
	//회원탈퇴
	public int membersUnresigter(MembersVO vo);
	
	//아이디 중복 확인
	public int checkId(MembersVO vo);
	
	//비밀번호 확인 
	public int checkPwd(MembersVO vo);
	
	//아이디 비밀번호 확인
	public int checkIdPwd(MembersVO vo);
}
