package com.spring.admin.board.controller;

import java.util.List;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.admin.board.service.AdminBoardService;
import com.spring.client.board.vo.BoardVO;
import com.spring.client.board.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminBoardController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminBoardService adminBoardService;
	
	
	/************************************************
	 * 글목록
	 * 요청 url : http://localhost:8080/admin/board/adminBoardList
	************************************************/
	@RequestMapping("/board/adminBoardList")
	public String adminBoardList(Model model,@ModelAttribute("data") BoardVO vo) {
		log.info("----------------------------------");
		log.info("adminBoardList() 호출");
		
		List<BoardVO> adminBoardList =adminBoardService.boardList(vo);
		model.addAttribute("adminBoardList",adminBoardList);
		
		int total = adminBoardService.boardListCnt(vo);
		PageDTO pageDto = new PageDTO(vo,total);
		model.addAttribute("pageDto",pageDto);
		
		
		int count = total - (vo.getPageNum()-1) * vo.getAmount();
		model.addAttribute("count",count);
		
		return "admin/board/adminBoardList";
	}
	
	/************************************************
	 * 상세페이지
	 * 요청 url : http://localhost:8080/admin/board/adminBoardDetail
	 * @throws Exception 
	************************************************/
	@RequestMapping("/board/adminBoardDetail")
	public String adminBoardDetail(Model model,@ModelAttribute("data") BoardVO bvo) throws Exception {
		log.info("adminBoardDetail() 호출");
		BoardVO detail = adminBoardService.boardDetail(bvo);
		model.addAttribute("detail",detail);
		
		return "admin/board/adminBoardDetail";
	}
	
	/************************************************
	 * 게시글 삭제
	 * 요청 url : http://localhost:8080/admin/board/adminBoardDelete
	************************************************/
	@RequestMapping("/board/adminBoardDelete")
	public String adminBoardDelete(Model model,@ModelAttribute("data") BoardVO vo) throws Exception {
		
		int result =adminBoardService.boardDelete(vo);
		log.info("adminBoardDelete() 호출 result : " + result);
		if(result == 1)
			return "redirect:/admin/board/adminBoardList";
		else
			return "redirect:/admin/board/adminBoardDetail";
	}
	
	
}
