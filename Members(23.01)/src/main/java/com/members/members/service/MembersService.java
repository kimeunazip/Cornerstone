package com.members.members.service;

import java.util.ArrayList;

import com.members.members.dao.MembersDAO;
import com.members.members.vo.MembersVO;

public class MembersService {
	
		private static MembersService service = null;
	
	//singleton
		private MembersDAO dao = MembersDAO.getInstance();
		
		private MembersService() {}
		
		public static MembersService getInstance() {
			if(service ==null) {
				service= new MembersService();
			}
			return service;
		}
		
	//Create(2)
		public boolean membersInsert(MembersVO vo) {
		      boolean result = dao.membersInsert(vo);
		      return result;
		}
		
		public int signupIdCheck(String inputId) {
			int result = dao.signupIdCheck(inputId);
			return result;
		}
		
	//Read(4)
		public ArrayList<MembersVO> membersList() {
			ArrayList<MembersVO> list = dao.membersList();
			return list;
		}
		
		public MembersVO membersDetail(String num) {
			MembersVO vo = dao.membersDetail(num);
			return vo;
		}
		
		public MembersVO login(MembersVO vo) {
			MembersVO data = dao.login(vo);
			return data;
		}
		
		public int membersLoginCheck(MembersVO vo) {
			int result = dao.membersLoginCheck(vo);
			return result;
		}
		
	//Update(2)
		public int membersUpdate(MembersVO vo) {
			int result = dao.membersUpdate(vo);
			return result;
		}
		
		public int membersPwCheck(String num, String passwd) {
			
			int result = dao.membersPwCheck(num,passwd);
			
			return result;
		}
		
	//Delete(1)
		public void membersDelete(String num) {
			dao.membersDelete(num);
		}
		
}
