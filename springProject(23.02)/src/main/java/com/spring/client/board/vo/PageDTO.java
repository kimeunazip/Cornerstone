package com.spring.client.board.vo;

import com.spring.common.vo.CommonVO.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageDTO { //page 관련 모든것
	
	private int startPage; //화면 페이지 네이션 부분의 첫 페이지 (맨 앞 페이지), 화면에서 보여지는 페이지의 시작번호
	private int endPage;	//화면에서 보여지는 페이지의 마지막 번호 (맨 마지막 페이지)
	private boolean prev,next; //이전페이지,다음페이지 (있으면 true, 없으면 false)
	
	private int total; //전체 데이터 개수 
	private CommonVO cvo; //pageNum,amount을 가져오기위해 BoardVO의 슈퍼클래스
	
	public PageDTO(CommonVO cvo, int total) {
		this.cvo = cvo;
		this.total = total;
		
		//화면에 보여 줄 페이지
		this.endPage = (int)(Math.ceil(cvo.getPageNum()/10.0)* 10);  //10개의 데이터를 보여줄 때,끝페이지
		this.startPage = this.endPage - 9; //시작페이지
		
		//전체 데이터의 마지막 페이지 = totalPage(전체페이지)
		int realEnd = (int)(Math.ceil((total *1.0) / cvo.getAmount()));
		
		//endPage는 realEnd를 초과할 수 없다. 초과하면 endPage를 realEnd로
		if(realEnd <= this.endPage) this.endPage = realEnd;
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
	}
}
