package com.spring.common.vo.CommonVO;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;
import lombok.Setter;

@Data
public class CommonVO {
	@Setter(onMethod_ = @Autowired)
	private String search = ""; //검색할 대상,범위,카테고리
	private String keyword =""; //검색할 단어
	
	private int pageNum; //현재 페이지
	private int amount; //한 페이지당 데이터 개수 per PageNum
	
	//날짜검색시 사용할 필드(시작일, 종료일)
	private String start_date;
	private String end_date;
	
	public CommonVO() {
		this(1,10);
	}
	
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
