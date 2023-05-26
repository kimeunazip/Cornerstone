package com.members.common.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class MembersEncoderFilter implements Filter{
	private String encoding;
	
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("EncoderFilter클래스의 init메서드 입니다. ");
		System.out.println("utf-8 encoding 성공 ");
		
		encoding = fConfig.getInitParameter("encoding");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws ServletException, IOException{
		System.out.println("EncoderFilter클래스의 doFilter메서드 입니다. \n");
		
		request.setCharacterEncoding(encoding);
		
		chain.doFilter(request, response);
		
	}

}
