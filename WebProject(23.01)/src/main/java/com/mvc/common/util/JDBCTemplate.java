package com.mvc.common.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBCTemplate { //module
	
	//DBCP를 이용한 DB 연결
	//singleton
	private JDBCTemplate() {}

	private static JDBCTemplate instance = null;
	
	public static JDBCTemplate getInstance() {
		if(instance==null) {
			instance = new JDBCTemplate();
		}
		return instance;
	}

	public static Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle18c");//java:comp/env는 고정값
		return ds.getConnection();
	}
	
	//2. commit()
	public static void commit(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) 
				conn.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//3. rollback()
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.rollback();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//4.close(Connection conn),close(PreparedStatement prsmt),close(ResultSet rs)
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement prsmt) {
		try {
			if(prsmt != null && !prsmt.isClosed())
				prsmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs != null && !rs.isClosed())
				rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
