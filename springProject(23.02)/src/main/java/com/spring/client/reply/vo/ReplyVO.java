package com.spring.client.reply.vo;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;
import lombok.Setter;

@Data
public class ReplyVO {
	
	@Setter(onMethod_ = @Autowired)
	private int r_num =0;
	private int b_num =0;
	private String r_name ="";
	private String r_content="";
	private int r_pwd =0;
	private String r_date ="";
	
}
