package com.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/modify")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

		//db연동 field
		private static final String JDBC_URL = "jdbc:oracle:thin:@127.0.0.1:1521/xepdb1";
	    private static final String USER = "c##javauser";
	    private static final String PASSWD = "java1234";
	    private static final String CLASSNAME = "oracle.jdbc.driver.OracleDriver";
		Connection con;
		Statement sm;
		ResultSet rs;
		
		private String name,id,pw,contact1,contact2,contact3,gender;
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("Call doPost() - ModifyOk.java");
		name = request.getParameter("name"); 
		id = request.getParameter("id"); 
		pw = request.getParameter("pw"); 
		contact1 = request.getParameter("contact1"); 
		contact2 = request.getParameter("contact2"); 
		contact3 = request.getParameter("contact3"); 
		gender = request.getParameter("gender"); 
		
		String query = "update member set name='"+name+"',pw='"+pw+"',contact1='"+contact1+"',contact2='"+contact2
				+"',contact3='"+contact3+"',gender='"+gender+"' where id = '"+id+"'";
		try {
			Class.forName(CLASSNAME);
			con = DriverManager.getConnection(JDBC_URL,USER,PASSWD);
			sm = con.createStatement();
			int i = sm.executeUpdate(query);
			
			if(i == 1) {
				System.out.println("UPDATE SUCCESS");
				response.sendRedirect("jsp/modifyResult.jsp");
			}else {
				System.out.println("UPDATE FAIL");
				response.sendRedirect("jsp/Modify.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(sm != null) sm.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
	}

}
