package com.members.common.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MembersJDBCTemplate { 
	
	//singleton
	private MembersJDBCTemplate() {}

	private static MembersJDBCTemplate instance = null;
	
	public static MembersJDBCTemplate getInstance() {
		if(instance==null) {
			instance = new MembersJDBCTemplate();
		}
		return instance;
	}

	public static Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle18c");
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
