package com.spring.client.board.vo;


import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/* equals와 hashCode 메소드 자동 생성 시 부모 클래스의 필드까지 감안할지 안 할지에 대해서 설정시
 * callSuper = true로 설정하면 부모 클래스 필드 값들도 동일 한지 체크하며, 
 * callSuper = false로 설정(기본값)하면 자신 클래스의 필드 값들만 고려한다*/

@Data
@EqualsAndHashCode(callSuper=false)
public class BoardVO extends CommonVO{
	
	private int b_num =0;
	private String b_name ="";
	private String b_title ="";
	private String b_content ="";
	private String b_pwd ="";
	private String b_date ="";
	
	private int b_hit=0;
	
	/*
	private int repRoot=0;
	private int repStep=0;
	private int repIndent=0;

	*/
	
	private MultipartFile file; //클라이언트가 전송한 파일을 받기 위한 객체, 지금 파일업로드가 1개이므로 한개
	
	//private MultipartFile file2	//다수의 파일을 업로드할때 객체도 여러개 있어야한다.				
	
	//올릴수있는 파일은 1개인데 여러번 업로드히면? 코드상에서 파일명을 가공하여 중복제어 
	private String b_thumb =""; // 실젲 서버에 저장할 썸네일 이미지 파일명
	private String b_file = ""; // 실제 서버에 저장할 파일명
	
	private int r_cnt =0; //댓글갯수
	
}
