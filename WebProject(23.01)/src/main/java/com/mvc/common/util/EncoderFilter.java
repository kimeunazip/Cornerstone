package com.mvc.common.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncoderFilter implements Filter{
	private String encoding;
	
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("EncoderFilter.java > init() ");
		System.out.println("utf-8 encoding success ");
		
		encoding = fConfig.getInitParameter("encoding");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws ServletException, IOException{
		System.out.println("EncoderFilter.java > doFilter() ");
		
		request.setCharacterEncoding(encoding);
		
		chain.doFilter(request, response);
		
	}

}
