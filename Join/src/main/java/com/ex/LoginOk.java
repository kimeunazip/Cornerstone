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

@WebServlet("/login")
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//field
	private Connection con;
	private Statement sm;
	private String name,id,pw,contact1,contact2,contact3,gender;
	
	//db연동 field
	private static final String JDBC_URL = "jdbc:oracle:thin:@127.0.0.1:1521/xepdb1";
    private static final String USER = "c##javauser";
    private static final String PASSWD = "java1234";
    private static final String CLASSNAME = "oracle.jdbc.driver.OracleDriver";
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Call doPost() - LoginOk.java");
		
		//입력한 아이디와 비밀번호가 DB에 있는지,
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		String query = "select * from member where id='"+id+"' and pw='"+pw+"'";
		
		try {
			Class.forName(CLASSNAME);
			con = DriverManager.getConnection(JDBC_URL,USER,PASSWD);
			sm = con.createStatement();
			ResultSet rs = sm.executeQuery(query);
			
			while(rs.next()) {
				name = rs.getString("name");
				id= rs.getString("id");
				pw= rs.getString("pw");
				contact1= rs.getString("contact1");
				contact2= rs.getString("contact2");
				contact3= rs.getString("contact3");
				gender= rs.getString("gender");
			}
			
			HttpSession hs = request.getSession();
			hs.setAttribute("name", name);
			hs.setAttribute("id", id);
			hs.setAttribute("pw", pw);
			
			response.sendRedirect("jsp/loginResult.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(sm != null) 
					sm.close();
				if(con != null)
					con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

}
