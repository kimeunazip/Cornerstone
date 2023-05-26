package com.members.common.controller;

import java.util.HashMap;
import java.util.Map;

import com.members.members.controller.UnregisterMembersController;
import com.members.members.controller.AdminLoginFormController;
import com.members.members.controller.DetailMembersController;
import com.members.members.controller.GetMembersListController;
import com.members.members.controller.LoginCheckController;
import com.members.members.controller.LoginFormController;
import com.members.members.controller.LoginResultController;
import com.members.members.controller.MembersPwCheckCtroller;
import com.members.members.controller.SignupFormController;
import com.members.members.controller.SignupIdCheckController;
import com.members.members.controller.SignupMemberController;
import com.members.members.controller.UnregisterFormController;
import com.members.members.controller.UpdateFormController;
import com.members.members.controller.UpdateMembersController;


public class MembersHandlerMapping {
	private Map<String,Controller> mappings;
	
	public MembersHandlerMapping() {
		System.out.println("HandlerMapping서블릿 입니다.");
		
		mappings = new HashMap<String,Controller>();
		
		//회원가입
		mappings.put("/members/singupForm.do", new SignupFormController());
		mappings.put("/members/signUpMember.do", new SignupMemberController());
		mappings.put("/members/idCheck.do", new SignupIdCheckController());
		
		//로그인,로그아웃
		mappings.put("/members/loginForm.do",new LoginFormController() );
		mappings.put("/members/loginCheck.do",new LoginCheckController());
		mappings.put("/members/loginResultControll.do",new LoginResultController() );
		/* mappings.put("/members/logout.do",new LogoutFormController() ); */
		
		//회원정보관리
		mappings.put("/members/updateForm.do", new UpdateFormController());
		mappings.put("/members/updateMembers.do", new UpdateMembersController());
		mappings.put("/members/detailMembers.do", new DetailMembersController());
		mappings.put("/members/membersPwCheck.do", new MembersPwCheckCtroller());
	
		//회원탈퇴
		mappings.put("/members/unregisterForm.do", new UnregisterFormController());
		mappings.put("/members/unregisterResult.do", new UnregisterMembersController());
		
		//관리자페이지
		mappings.put("/members/adminLoginForm.do", new AdminLoginFormController());
		mappings.put("/members/getMembersList.do", new GetMembersListController());
	}
	
	public Controller getController(String path) {
		System.out.println("HandlerMapping서블릿의 getController 메서드입니다. ");
		System.out.println("Sub controller는 "+mappings.get(path)+"입니다.");
		return mappings.get(path); 
	}
}
