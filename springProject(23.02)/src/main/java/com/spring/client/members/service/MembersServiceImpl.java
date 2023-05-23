package com.spring.client.members.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.members.dao.MembersDAO;
import com.spring.client.members.vo.MembersVO;

import lombok.Setter;

@Service
public class MembersServiceImpl implements MembersService {

	@Setter(onMethod_ = @Autowired)
	private MembersDAO membersDao;
	
	@Override
	public int signUp(MembersVO vo) {
		int result = membersDao.signUp(vo);
		return result;
	}

	@Override
	public MembersVO logIn(MembersVO vo) {
		MembersVO mvo = membersDao.logIn(vo);
		return mvo;
	}

	@Override
	public List<MembersVO> membersList() {
		List<MembersVO> list = membersDao.membersList();
		return list;
	}

	@Override
	public MembersVO membersDetail(MembersVO vo) {
		MembersVO mvo = membersDao.membersDetail(vo);
		return mvo;
	}

	@Override
	public int membersUpdate(MembersVO vo) {
		int result = membersDao.membersUpdate(vo);
		return result;
	}

	@Override
	public int membersUnresigter(MembersVO vo) {
		int result = membersDao.membersUnresigter(vo);
		return result;
	}

	@Override
	public int checkId(MembersVO vo) {
		int result = membersDao.checkId(vo);
		return result;
	}

	@Override
	public int checkPwd(MembersVO vo) {
		int result = membersDao.checkPwd(vo);
		return result;
	}

	@Override
	public int checkIdPwd(MembersVO vo) {
		int result = membersDao.checkIdPwd(vo);
		return result;
	}


}
