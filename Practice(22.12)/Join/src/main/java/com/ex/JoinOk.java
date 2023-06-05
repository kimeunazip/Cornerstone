package com.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/join")
public class JoinOk extends HttpServlet {

	private String name;
	private String id;
	private String pw;
	private String contact1;
	private String contact2;
	private String contact3;
	private String gender;
	
	Connection con;
	Statement sm;
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		name=request.getParameter("name");
		id=request.getParameter("id");
		pw=request.getParameter("pw");
		contact1=request.getParameter("contact1");
		contact2=request.getParameter("contact2");
		contact3=request.getParameter("contact3");
		gender=request.getParameter("gender");
		
		String query = "insert into member(name,id,pw,contact1,contact2,contact3,gender) values('"+name+"','"+id+"','"+pw+"','"+contact1+"','"+contact2+"','"+contact3+"','"+gender+"')";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1","c##javauser","java1234");
			sm = con.createStatement();
			
			int i = sm.executeUpdate(query);
			
			if(i == 1) {
				System.out.println("INSERT SUCCESS");
				
				HttpSession hs = request.getSession();
				hs.setAttribute("name", name);
				hs.setAttribute("id", id);
				
				response.sendRedirect("jsp/joinResult.jsp");
			}else {
				System.out.println("INSERT FAIL");
				response.sendRedirect("join.html");
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(sm != null) 
					sm.close();
				
				if(con != null) 
					con.close();
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
