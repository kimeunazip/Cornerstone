package com.spring.client.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;
import com.spring.client.board.vo.PageDTO;
import com.spring.common.file.FileUploadUtil;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	/************************************************
	 * 게시판 전체조회
	 * 요청 url : http://localhost:8080/board/boardList
	***********************************************
	@GetMapping("/boardList")
	public String boadrList(Model model ) {
		log.info("boadrList(Model model) 호출");
		
		List<BoardVO> boardList =boardService.boardList();
		model.addAttribute("boardList",boardList);
		return "board/boardList";
	}
	*/
	
	/************************************************
	 * 게시글 페이징 처리
	 * 요청 url : http://localhost:8080/board/paging
	************************************************/
	/* @RequestMapping("/pagingList") 
	@RequestMapping("/boardList")
	public String pagingList(Criteria criteria, Model model) {
		log.info("pagingList() 호출");
		
		//1.
		List<BoardVO> pagingList =boardService.pagingList(criteria);
		model.addAttribute("pagingList",pagingList);
		
		log.info("pagingList : " +pagingList );
		log.info("----------------------------------");

		//2.
		int total = boardService.getTotal();
		PageDTO pageDto = new PageDTO(criteria,total);
		model.addAttribute("pageDto",pageDto);
		
		log.info("pageDto : " +pageDto );
		log.info("----------------------------------");
		
		return "board/pagingList";
	}
	*/
	
	/************************************************
	 * 게시글 검색 처리
	 * 요청 url : http://localhost:8080/board/paging
	************************************************/
	/* @RequestMapping("/searchList") 
	@RequestMapping("/boardList")
	public String searchList(Criteria criteria, Model model) {
		log.info("searchList() 호출");
		
			/*
		//3.
		List<BoardVO> searchableList =boardService.boardList(vo);
		model.addAttribute("searchableList",searchableList);
		
		log.info("searchableList : " +searchableList );
		log.info("----------------------------------");
		
		log.info("model : " +model );
		log.info("----------------------------------");
		
	}
	*/
	/************************************************
	 * 게시글 페이징 처리 + 검색기능
	 * 요청 url : http://localhost:8080/board/boardList
	************************************************/
	@RequestMapping("/boardList")
	public String searchPagingList(Model model,@ModelAttribute BoardVO vo) {
		//Service단에서 aop이용 
		//log.info("searchPagingList() 호출");
		
		//1.
		List<BoardVO> searchPagingList =boardService.searchPagingList(vo);
		model.addAttribute("searchPagingList",searchPagingList);
		
		//Service단에서 aop이용 
		//log.info("searchPagingList : " +searchPagingList );
		//log.info("----------------------------------");

		
		//2.
		int total = boardService.getTotal(vo);
		PageDTO pageDto = new PageDTO(vo,total);
		model.addAttribute("pageDto",pageDto);
		
		//Service단에서 aop이용 
		/*
		log.info("getPageNum : " +vo.getPageNum() );
		log.info("getPageNum : " +vo.getPageNum() );
		log.info("----------------------------------");
		*/
		
		
		return "board/boardList";
	}
	
	/************************************************
	 * 게시글 입력화면
	 * 요청 url : http://localhost:8080/board/writeForm
	************************************************/
	@RequestMapping("/writeForm")
	public String writeForm(){
		//Service단에서 aop이용 
		//log.info("writeForm() 호출");
		//로직처리할건 없다.
		return "board/writeForm";
	}
	
	/************************************************
	 * 게시글 입력처리
	 * 요청 url : http://localhost:8080/board/boardInsert
	************************************************/
	@PostMapping("/boardInsert")
	public String boardInsert(@ModelAttribute BoardVO bvo,Model model) throws Exception{
		log.info("boardInsert() 호출");
		
		log.info(bvo.toString());
		int result = 0;
		
		if(bvo.getFile().getSize() >0) {
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "board");
			bvo.setB_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			bvo.setB_thumb(thumbName);
		}
		log.info(bvo.toString());	
		result = boardService.boardInsert(bvo);
		
		if(result == 1)
			return "redirect:/board/boardList";
		else
			return "redirect:/board/writeForm";
	}
	
	
	/************************************************
	 * 게시글 상세조회
	 * 요청 url : http://localhost:8080/board/boardDetail
	************************************************/
	@RequestMapping("/boardDetail")
	public String boardDetail(@ModelAttribute BoardVO bvo,Model model) throws Exception{
		//Service단에서 aop이용 
		/* log.info("boardDetail() 호출"); */
		
		boardService.updateHit(bvo);
		BoardVO detail = boardService.boardDetail(bvo);
		model.addAttribute("detail",detail);
		
		return "board/boardDetail";
	}
	
	/************************************************
	 * 게시글 비밀번호 확인
	 * 요청 url : http://localhost:8080/board/updateForm
	************************************************/
	@ResponseBody  //ajax를 위한 어노테이션 추가
	@RequestMapping(value="/pwdCheck",method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String pwdCheck(@ModelAttribute BoardVO bvo){
		//Service단에서 aop이용 
		/*
		 log.info("pwdCheck() 호출");
		 */

		String result="";
		int checkData =boardService.pwdCheck(bvo);
		
		
		if(checkData == 1) {
			result = "성공";
		}else if(checkData == 0) {
			result = "실패";
		}else {
			result = "오류";
		}
		
		//Service단에서 aop이용 
		//log.info("checkData : "+checkData +", result :"+result);
		
		return result; //값자체를 브라우저에 출력
	}
	
	
	/************************************************
	 * 게시글 수정화면
	 * 요청 url : http://localhost:8080/board/updateForm
	************************************************/
	@PostMapping("/updateForm")
	public String updateForm(@ModelAttribute BoardVO bvo,Model model) throws Exception{
		//Service단에서 aop이용 
		//log.info("updateForm() 호출");

		BoardVO update = boardService.updateForm(bvo);
		
		model.addAttribute("update",update);
		
		return "board/updateForm";
	}
	
	/************************************************
	 * 게시글 수정 처리
	 * 요청 url : http://localhost:8080/board/boardUpdate
	************************************************/
	@RequestMapping("/boardUpdate")
	public String boardUpdate(@ModelAttribute BoardVO vo) throws Exception{
		//Service단에서 aop이용 
		/*
		log.info("boardUpdate() 호출");
		log.info("vo"+vo.toString());
		*/
		
		int result = 0;
		
		if(vo.getFile().getSize() >0) {
			String fileName = FileUploadUtil.fileUpload(vo.getFile(), "board");
			vo.setB_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			vo.setB_thumb(thumbName);
		}
		
		//log.info(vo.toString());	
		
		result = boardService.boardUpdate(vo);
		
		if(result == 1)
			return "redirect:/board/boardDetail?b_num="+vo.getB_num();
		else
			return "redirect:/board/error";
	}
	
	/************************************************
	 * 게시글 삭제
	 * 요청 url : http://localhost:8080/board/boardDelete
	************************************************/
	@PostMapping("/boardDelete")
	public String boardDelete(@ModelAttribute BoardVO bvo,Model model) throws Exception{
		//Service단에서 aop이용 
		//log.info("boardDelete() 호출");
		
		int result =boardService.boardDelete(bvo);
		
		if(result == 1)
			return "redirect:/board/boardList";
		else
			return "redirect:/board/boardDetail";
	}
	
	/**************************************************************
	 * 게시글 삭제전 댓글 개수 구현하기
	 * @param int
	 **************************************************************/
	@ResponseBody
	@RequestMapping(value="/replyCnt")
	public String replyCnt(@RequestParam("b_num") int b_num) {
		//Service단에서 aop이용 
		//log.info("replyCnt() 호출");
		
		int result=0;
		result=boardService.replyCnt(b_num);
		
		return String.valueOf(result);
	}
	
	/**************************************************************
	 * 관리자페이지
	 **************************************************************/
	@RequestMapping("/resources/admin")
	public String admin() {
		log.info("admin() 호출");
		return "/board/admin";
	}
}

