package com.members.common.controller;

public class ViewResolver {
	
	public String prefix;
	public String suffix;
	
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	
	public String getView(String viewName) { 
		
		System.out.println("ViewResolver클래스의 getView메서드입니다. ");
		System.out.println("view(jsp파일)의 주소 "+ prefix + viewName + suffix+"를 반환합니다.");
	
		return prefix + viewName + suffix;
	}
	
}
