package com.mvc.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//mapping정보는 web.xml에 명시할 것이다.
public class DispatcherServlet extends HttpServlet { //Front Controller - 모든 요청을 여기서 받을 것.
	private static final long serialVersionUID = 1L;
	
	private HandlerMapping handlerMapping;
	private ViewResolver viewResolver;
	
	public void init() throws ServletException{
		System.out.println("DispatcherServlet.java > init() ");
		
		handlerMapping = new HandlerMapping();
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
		System.out.println("DispatcherServlet.java > process() ");
		
		/*
		context path가 설정되있는 경우 path정보만 추출하기
		
		1. request의 URI 얻어오기
		String URI = request.getRequestURI();
		
		http://localhost:8080/webProject/board/getBoardList.do -> 
		/webProject/board/getBoardList.do
		
		2.그 URI에서 path만 얻어오기 == URI에서 contextPath를 제거하기
		String PATH = URI.substring(request.getContextPath().length());
		
		 */
		
		//context path가 설정되어있지않으면 이 메서드만 써도 path를 추출할 수 있다.
		String path = request.getRequestURI();
		
		Controller ctrl = handlerMapping.getController(path); //다형성 : 인터페이스 참조변수 = 구현클래스.메서드();
		
		String viewName = ctrl.execute(request, response); //GetBoardList의 execute메서드 실행결과 반환된 viewName 
		//forward할 대상의 폴더명과 파일명만 
		
		String view = null;
		
		if(!viewName.contains(".do")) {
			view = viewResolver.getView(viewName);
			
			try {
				RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else { //.do가 붙어있으면
			view = viewName;
			response.sendRedirect(view);
		}
		
	}
	
	

}
