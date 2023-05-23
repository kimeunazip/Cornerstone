package com.spring.client.members.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.client.members.service.MembersService;
import com.spring.client.members.vo.MembersVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/members/*")
@Log4j
public class MembersController {

	@Setter(onMethod_ = @Autowired)
	private MembersService membersService;
	
	/************************************************
	 * 로그인,회원가입 화면
	 * 요청 url : http://localhost:8080/members/logInForm
	************************************************/
	@RequestMapping("/logInForm")
	public String logInForm() {
		log.info("logInForm() 호출");
		return "members/logInForm";
	}
	
	/************************************************
	 * 회원가입 화면
	 * 요청 url : http://localhost:8080/members/signUpForm
	************************************************/
	@RequestMapping("/singUpForm")
	public String signUpForm() {
		log.info("signUpForm() 호출");
		return "members/signUpForm";
	}
	
	/************************************************
	 * 회원가입
	 * 요청 url : http://localhost:8080/members/signUp
	************************************************/
	@RequestMapping("/signUp")
	public String singUp(@ModelAttribute MembersVO vo) {
		log.info("singUp() 호출");
		
		int result = membersService.signUp(vo);
		
		if(result==1)
			return "members/logInForm";
		else
			return "members/singUpForm";
		
	}
	
	/************************************************
	 * 로그인
	 * 요청 url : http://localhost:8080/members/logIn
	************************************************/
	@RequestMapping("/logIn2")
	public String logIn(@ModelAttribute MembersVO vo,Model model) {
		log.info("logIn() 호출");
		
		MembersVO loginData = membersService.logIn(vo);
		model.addAttribute("loginData", loginData);
		
		return "members/loginResult";
		
	}
	
	/************************************************
	 * 회원정보 상세화면
	 * 요청 url : http://localhost:8080/members/membersDetail
	************************************************/
	@RequestMapping("/membersDetail")
	public String membersDetail(@ModelAttribute MembersVO vo,Model model) {
		log.info("membersDetail() 호출");
		
		MembersVO detailData = membersService.membersDetail(vo);
		model.addAttribute("detailData",detailData);
		
		return "members/membersDetail";
		
	}
	
	/************************************************
	 * 회원정보 수정화면
	 * 요청 url : http://localhost:8080/members/updateForm
	************************************************/
	@RequestMapping("/updateForm")
	public String updateForm(@ModelAttribute MembersVO vo,Model model) {
		log.info("updateForm() 호출");
		
		MembersVO updateData = membersService.membersDetail(vo);
		model.addAttribute("updateData",updateData);
		
		return "members/updateForm";
		
	}
	
	/************************************************
	 * 회원정보 수정
	 * 요청 url : http://localhost:8080/members/membersUpdate
	************************************************/
	@RequestMapping("/membersUpdate")
	public String membersUpdate(@ModelAttribute MembersVO vo,Model model) {
		log.info("membersUpdate() 호출");
		
		int result = membersService.membersUpdate(vo);
		
		MembersVO loginData = membersService.membersDetail(vo);
		model.addAttribute("loginData",loginData);
		
		if(result==1)
			return "redirect:/members/membersDetail";
		else
			return "members/updateForm";
	}
	
	/************************************************
	 * 회원탈퇴 화면
	 * 요청 url : http://localhost:8080/members/membersUpdate
	************************************************/
	@RequestMapping("/unregisterForm")
	public String unregisterForm(@ModelAttribute MembersVO vo,Model model) {
		log.info("unregisterForm() 호출");
		
		MembersVO deleteData = membersService.membersDetail(vo);
		model.addAttribute("deleteData",deleteData);
		
		return "members/unregisterForm";
	}
	
	/************************************************
	 * 회원탈퇴 처리
	 * 요청 url : http://localhost:8080/members/membersUpdate
	************************************************/
	@RequestMapping("/membersUnresigter")
	public String membersUnresigter(@ModelAttribute MembersVO vo,Model model) {
		log.info("membersUnresigter() 호출");
		
		int result = membersService.membersUnresigter(vo);
		
		if(result==1)
			return "members/logInForm";
		else
			return "members/unregisterForm";
	}
	
	/************************************************
	 * 관리자 로그인 화면
	 * 요청 url : http://localhost:8080/members/signUpForm
	************************************************/
	@RequestMapping("/adminLogInForm")
	public String adminLogInForm() {
		log.info("adminLogInForm() 호출");
		return "members/adminLogInForm";
	}
	
	/************************************************
	 * 회원 리스트 
	 * 요청 url : http://localhost:8080/members/membersList
	************************************************/
	@RequestMapping("/membersList")
	public String membersList(Model model) {
		log.info("membersList() 호출");
		
		List<MembersVO> list = membersService.membersList();
		model.addAttribute("list", list);
		
		return "members/membersList";
	}
	/************************************************
	 * 아이디 비밀번호 확인 (로그인)
	 * 요청 url : http://localhost:8080/members/checkIdPwd
	************************************************/
	@RequestMapping("/checkIdPwd")
	public String checkIdPwd(@ModelAttribute MembersVO vo, Model model) {
		log.info("checkIdPwd() 호출");
		
		int checkData = membersService.checkIdPwd(vo);
		model.addAttribute("checkData",checkData);
		log.info("checkIdPwd() checkData"+checkData);
		return "/common/checkData";
		
	}
	
	/************************************************
	 * 아이디 중복 확인 (회원가입)
	 * 요청 url : http://localhost:8080/members/checkId
	************************************************/
	@RequestMapping("/checkId")
	public String checkId(@ModelAttribute MembersVO vo, Model model) {
		log.info("checkId() 호출");
		
		int checkData = membersService.checkId(vo);
		log.info("checkId() 호출checkData"+checkData);
		model.addAttribute("checkData",checkData);
		
		return "/common/checkData";
		
	}
	
	/************************************************
	 * 비밀번호 확인 (회원정보수정,탈퇴 시)
	 * 요청 url : http://localhost:8080/members/checkPwd
	************************************************/
	@RequestMapping("/checkPwd")
	public String checkPwd(@ModelAttribute MembersVO vo, Model model) {
		log.info("checkPwd() 호출");
		
		int checkData = membersService.checkPwd(vo);
		model.addAttribute("checkData",checkData);
		
		return "/common/checkData";
		
	}
}
