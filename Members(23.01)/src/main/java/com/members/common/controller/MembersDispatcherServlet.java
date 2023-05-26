package com.members.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MembersDispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MembersHandlerMapping handlerMapping;
	private ViewResolver viewResolver;
	
	public void init() throws ServletException{
		System.out.println("MembersDispatcherServlet서블릿의 init메서드입니다. ");
		
		handlerMapping = new MembersHandlerMapping();
		viewResolver = new ViewResolver();
		
		viewResolver.setPrefix("/WEB-INF");
		viewResolver.setSuffix(".jsp");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		process(request,response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("MembersDispatcherServlet서블릿의 process메서드 입니다. ");
		
		String path = request.getRequestURI();
		
		Controller ctrl = handlerMapping.getController(path); 
		
		String viewName = ctrl.execute(request, response); 
		
		String view = null;
		if(!viewName.contains(".do")) {
			view = viewResolver.getView(viewName);
			
			try {
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);
				return;
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else { 
			view = viewName;
			response.sendRedirect(view);
		}
		
	}
}
