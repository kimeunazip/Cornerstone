package com.mvc.common.controller;

public class ViewResolver {
	
	public String prefix;
	public String suffix;
	
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	
	public String getView(String viewName) { //viewName = GetBoardListController에서 반환 받은 값
		System.out.println("ViewResolver.java > getView() ");
		
		return prefix + viewName + suffix;	// 여기서 온전한 형태가 탄생
	}
	
}
