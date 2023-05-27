package com.spring.admin.login.controller;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.login.service.AdminLoginService;
import com.spring.admin.login.vo.AdminLoginVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
/******************************************************************
 * @SessionAttributes 파라미터로 지정된 이름과 같은 이름이 
 * @ModelAttribute에 지정되어 있을 경우 메소드가 반환되는 값은 세션에 저장된다.
*******************************************************************/
@SessionAttributes("adminLogin")
public class AdminLoginController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminLoginService adminLoginService;
	
	/******************************************************************
	 * @SessionAttributes의 파라미터와 같은 이름이 @ModelAttribute에 있을 경우 
	 * 세션에 있는 객체를 가져온 후, 클라이언트로 전송받은 값을 설정한다. 
	 *******************************************************************/
	@ModelAttribute
	public AdminLoginVO adminLogin(){
		return new AdminLoginVO();
	}
	
	/**************************************************************
	 * 로그인 화면[관리자 메인] 메서드
	 * 요청 URL: http://localhost:8080/admin/login으로 요청
	 **************************************************************/
	@GetMapping("/login")
	public String adminLoginForm() {
		log.info("adminLoginForm() 호출");
		return "admin/main";
	}
	
	/**************************************************************
	 * 로그인 처리 메서드
	 * 참고 : 자바단에서 세션의 값을 사용할 경우 로그인을 처리하는 컨트롤러 클래스 위에 
	 * @SessionAttributes("adminLogin") 명시해 준 이름을
	 * 로그인 정보가 필요한 Controller 내 메서드에서 다음과 같이 매개변수를 명시해 주면 된다. 
	 * public 반환형 메서드명(@SessionAttribute("adminLogin") VO클래스명 참조변수)로 
	 * 정의하고 사용하면 된다.
	 * 
	 * RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에 
	 * 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다. 
	 * addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만, 
	 * URI에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
	 * redirect:/admin/login?errorMsg=error이라고 전송을 하여야 하는데
	 * 이때 ras.addFlashAttribute("errorMsg", "error"); 
	 * redirect:/admin/login으로 이동
	 **************************************************************/
	@PostMapping("/login")
	//public String loginProcess(AdminLoginVO vo,HttpSession session,RedirectAttributes ras) {
	public String loginProcess(AdminLoginVO vo, Model model, RedirectAttributes ras) {
		log.info("loginProcess() 호출");
	
		String url ="";
		AdminLoginVO adminLogin = adminLoginService.loginProcess(vo);
		if(adminLogin != null) {
			//session.setAttribute("adminLogin", adminLogin);
			model.addAttribute("adminLogin", adminLogin);
			url = "/admin/board/adminBoardList";
		}else {
			ras.addFlashAttribute("errorMsg", "로그인 실패");
			url = "/admin/login";
		}
		return "redirect:"+url;
	}
	
	/**************************************************************
	 * 로그아웃 처리 메서드
	 * setComplete() 메서드를 활용하여 세션을 할당 해지
	 **************************************************************/
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		log.info("logout() 호출");
		sessionStatus.setComplete();
		return "redirect:/admin/login";
	}
}
