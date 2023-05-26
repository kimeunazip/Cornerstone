package com.members.members.dao;


import static com.members.common.util.MembersJDBCTemplate.*;
import static com.members.common.util.MembersJDBCTemplate.close;
import static com.members.common.util.MembersJDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.members.members.vo.MembersVO;

public class MembersDAO {
	
	//singleton
		private static MembersDAO instance = null;
		
		public static MembersDAO getInstance() {
			if(instance==null) {
				instance = new MembersDAO();
			}
			return instance;
		}
		
		private MembersDAO (){}
		
	//Create(2)
		/***********************************************************
		* membersInsert() 메서드: 회원가입 처리 메서드.
		* @param MembersVO.
		* @return boolean 리턴.
		* 회원등록일자는 sysdate
		***********************************************************/
		public boolean membersInsert(MembersVO vo) {
			
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      boolean result = false;
		      try {
		         conn = getConnection();
		         StringBuffer query = new StringBuffer();
		         query.append("insert into members(num,id,pw,name,phone,email,address) ");
		         query.append("values( members_seq.nextval, ?, ?, ?, ?, ?, ?)");
		         
		         pstmt = conn.prepareStatement(query.toString());
		         pstmt.setString(1, vo.getId());
		         pstmt.setString(2, vo.getPw());
		         pstmt.setString(3, vo.getName());	
		         pstmt.setString(4, vo.getPhone());
		         pstmt.setString(5, vo.getEmail());
		         pstmt.setString(6, vo.getAddress());	
		         
		         if(pstmt.executeUpdate() == 1) result=true;
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         close(pstmt);
		         close(conn);
		      }
		      return result;
		   }
		
		/***********************************************************
		* signupIdCheck() 메서드: 아이디 중복 체크 메서드
		* @param 입력한 id
		* @return int 리턴.
		***********************************************************/
		public int signupIdCheck(String inputId) {
			
	    	Connection conn = null;
	    	PreparedStatement pstm = null;
	    	ResultSet rs = null; 
	    	int result = 0;
	    	
	    	try {
	    		conn = getConnection();
	    		
	    		StringBuffer query = new StringBuffer();
		        query.append("SELECT nvl((select count(*) from members where id = ? ");
		        query.append("), 0) as result from dual");
	    		
	    		pstm = conn.prepareStatement(query.toString());
	    		pstm.setString(1, inputId);
	    		
	    		rs = pstm.executeQuery();  
	    		
	    		while(rs.next()) {
	    			result = rs.getInt("result");
	    		}
	    		
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}finally {
	    		try {
	    			if(rs != null) rs.close();
	    			if(pstm != null) pstm.close();
	    			if(conn != null) conn.close();
	    		}catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    	}
	    	
			return result;
		}
	//Read(4)
		/*
		* **********************************************************
		* membersList() 메서드: 회원 목록 조회(검색 처리 제외)
		* @return ArrayList<MembersVO> 리턴.
		**********************************************************/
		public ArrayList<MembersVO> membersList(){
			
			ArrayList<MembersVO> list = new ArrayList<>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = getConnection(); 
				
				StringBuffer sql = new StringBuffer();
				sql.append("select num,id,pw,name,phone,email,address,regdate,status from members ");
				sql.append("order by num asc ");
			
				pstmt = conn.prepareStatement(sql.toString());
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					MembersVO vo = new MembersVO();
					
					vo.setNum(rs.getInt("num"));
					vo.setId(rs.getString("id"));
					vo.setPw(rs.getString("pw"));
					vo.setName(rs.getString("name"));
					vo.setPhone(rs.getString("phone"));
					vo.setEmail(rs.getString("email"));
					vo.setAddress(rs.getString("address"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setStatus(rs.getInt("status"));
					
					list.add(vo);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				close(conn);
			}
			return list;
		}
		
		/***********************************************************
		* membersDetail() 메서드: 회원정보 상세 페이지 출력 메서드.
		* @param 게시물 번호. 번호를 숫자로 받은 이유는 필요시 변환하여 사용하기 때문에.
		* @return BoardVO 리턴
		***********************************************************/
		public MembersVO membersDetail(String num) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			MembersVO vo = new MembersVO();
			
			try {
				conn = getConnection(); 
				StringBuffer sql = new StringBuffer();
				sql.append("select num,id,pw,name,phone,email,address,regdate,status  ");
				sql.append("from members where num = ? ");
		        
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, num);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					vo.setNum(rs.getInt("num"));
					vo.setId(rs.getString("id"));
					vo.setPw(rs.getString("pw"));
					vo.setName(rs.getString("name"));
					vo.setPhone(rs.getString("phone"));
					vo.setEmail(rs.getString("email"));
					vo.setAddress(rs.getString("address"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setStatus(rs.getInt("status"));
					
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				close(conn);
			}
			
			return vo;
		}
	
		/***********************************************************
		* login() 메서드: 로그인 처리 메서드.
		* @param MembersVO vo
		* @return MembersVO mvo 리턴. 
		***********************************************************/
		public MembersVO login(MembersVO vo) {
			
	    	Connection conn = null;
	    	PreparedStatement pstm = null;
	    	ResultSet rs = null; 
	    	
	    	MembersVO mvo = null;
	    	
	    	try {
	    		StringBuffer sql = new StringBuffer();
				sql.append("select num,id,pw,name,phone,email,address,regdate,status  ");
				sql.append("from members where id = ? and pw = ? ");
				
	    		conn = getConnection();
	    		pstm = conn.prepareStatement(sql.toString());
	    		
	    		pstm.setString(1, vo.getId());
	    		pstm.setString(2, vo.getPw());
	    		
	    		rs = pstm.executeQuery();  
	    		
	    		while(rs.next()) {
	    			
	    			mvo = new MembersVO();
	    			
	    			mvo.setNum(rs.getInt("num"));
	    			mvo.setId(rs.getString("id"));
	    			mvo.setPw(rs.getString("pw"));
	    			mvo.setName(rs.getString("name"));
	    			mvo.setPhone(rs.getString("phone"));
	    			mvo.setEmail(rs.getString("email"));
	    			mvo.setAddress(rs.getString("address"));
	    			mvo.setRegdate(rs.getString("regdate"));
	    			mvo.setStatus(rs.getInt("status"));
	    		}
	    		
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}finally {
	    		try {
	    			if(rs != null) rs.close();
	    			if(pstm != null) pstm.close();
	    			if(conn != null) conn.close();
	    		}catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    	}
	    	
	    	return mvo;
	    	
	    }
		
		/***********************************************************
		* membersLoginCheck() 메서드: 아이디 비밀번호 확인 처리 메서드.
		* @param MembersVO vo
		* @return int 리턴. 
		***********************************************************/
		public int membersLoginCheck(MembersVO vo) {
				
			  Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      int result = 0;
		      
		      try {
		         conn = getConnection();
		         StringBuffer query = new StringBuffer();
		         query.append("SELECT nvl((select count(*) from members where id = ? ");
		         query.append("and pw = ? and status = ? ), 0) as result from dual");
		         
		         pstmt = conn.prepareStatement(query.toString());
		         pstmt.setString(1,vo.getId());
		         pstmt.setString(2,vo.getPw());
		         pstmt.setInt(3,vo.getStatus());
		         
		         rs = pstmt.executeQuery();
		         if(rs.next()) {
		            result = rs.getInt("result"); 
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         close(rs);
		         close(pstmt);
		         close(conn);
		      }
		      return result;
		}

	//Update(2)
		/***********************************************************
		* membersUpdate() 메서드: 회원정보 수정 처리 메서드.
		* @param MembersVO.
		* @return int 리턴.
		* 회원정보 중에서 pw,phone,email,phone만 변경할 수 있다. (탈퇴시 status변경하는 메서드는 별도로 분리)
		* 비밀번호 변경은 새로운 비밀번호이든 아니는 반드시 입력해야한다.
		***********************************************************/
		public int membersUpdate(MembersVO vo) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			int result = 0;
			
			try {
				conn = getConnection(); 
				
				StringBuffer sql = new StringBuffer();
				sql.append("update members set pw= ?,phone=?, email=?, address=?  ");
				sql.append("where num = ? ");
		        
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, vo.getPw());
				pstmt.setString(2, vo.getPhone());
				pstmt.setString(3, vo.getEmail());
				pstmt.setString(4, vo.getAddress());
				pstmt.setInt(5, vo.getNum());
	
				if(pstmt.executeUpdate() == 1) result=1;
				
			}catch(SQLException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(conn);
			}
			
			return result;
			
		}
	
		/***********************************************************
		* membersPwChk() 메서드: 비밀번호 확인 처리 메서드
		* @param 회원번호, 회원비밀번호.
		* @return int 리턴.
		***********************************************************/
		public int membersPwCheck(String num, String pw) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int result = 0;
			
			try {
				conn = getConnection(); 
				
				StringBuffer sql = new StringBuffer();
				sql.append("select nvl((select count(*) from members where num = ? ");
				sql.append("and pw=?),0) as result from dual ");
			
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, Integer.parseInt(num));
				pstmt.setString(2, pw);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = rs.getInt("result");
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				close(conn);
			}
			return result;
		}
	
	//Delete(1)
		/***********************************************************
		* membersDelete() 메서드: 회원탈퇴 처리 메서드.
		* @param 회원 번호. 번호를 숫자로 받은 이유는 필요시 변환하여 사용하기 때문에.
		***********************************************************/
		public void membersDelete(String num){
			
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	
	        try {
	        	conn = getConnection();   
	        	
	        	StringBuffer sql = new StringBuffer();
	        	sql.append("update members set status = '1' ");
				sql.append("where num = ?");
	            
	            pstmt = conn.prepareStatement(sql.toString());  
	            pstmt.setInt(1, Integer.parseInt(num));
	            pstmt.executeUpdate();
	
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	    			close(pstmt);
	    			close(conn);
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
		}
		
}