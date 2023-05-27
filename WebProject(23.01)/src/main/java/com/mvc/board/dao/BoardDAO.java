package com.mvc.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.mvc.board.vo.BoardVO;

import static com.mvc.common.util.JDBCTemplate.*;

public class BoardDAO {
	
	//singleton
	private static BoardDAO instance = null;
	
	public static BoardDAO getInstanece() {
		if(instance==null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	private BoardDAO() {}
	
	
	/*
	* **********************************************************
	* boardList() 메서드: 게시판 목록 조회(검색 처리 제외)
	* @return ArrayList<BoardVO> 리턴.
	*********************************************************
	public ArrayList<BoardVO> boardList(){
		
		ArrayList<BoardVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection(); 
			
			StringBuffer sql = new StringBuffer();
			sql.append("select num,author,title,to_char(writeday,'YYYY/MM/DD') writeday, ");
			sql.append("readcnt,repRoot,repStep,repIndent from board ");
			sql.append("order by num asc");
			//repRoot desc, repStep asc 
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BoardVO vo = new BoardVO();
				
				vo.setNum(rs.getInt("num"));
				vo.setAuthor(rs.getString("author"));
				vo.setTitle(rs.getString("title"));
				vo.setWriteday(rs.getString("writeday"));
				vo.setReadcnt(rs.getInt("readcnt"));
				vo.setRepRoot(rs.getInt("repRoot"));
				vo.setRepStep(rs.getInt("repStep"));
				vo.setRepIndent(rs.getInt("repIndent"));
				
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
	 */
	/*
	* **********************************************************
	* boardList() 메서드: 게시판 목록 조회(검색 처리 포함)
	* @return ArrayList<BoardVO> 리턴.
	**********************************************************/
	public java.util.List<BoardVO> boardList(BoardVO vo) {
		List<BoardVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection(); 
			
			StringBuffer sql = new StringBuffer();
			sql.append("select num,author,title,to_char(writeday,'YYYY/MM/DD') writeday, ");
			sql.append("readcnt,repRoot,repStep,repIndent from board ");
			
		 
			//검색기능관련
			
			if("title".equals(vo.getSearch())) {
				sql.append("where title like ?");
			}else if("author".equals(vo.getSearch())) {
				sql.append("where author like ?");
			}else if("content".equals(vo.getSearch())) {
				sql.append("where content like ?");
			}
			
			
			
			sql.append("order by repRoot desc, repStep asc");
			//o num asc
			
			pstmt = conn.prepareStatement(sql.toString());
			
			//검색기능관련
			
			if(!"all".equals(vo.getSearch())) {
				pstmt.setString(1, "%" + vo.getKeyword() + "%" );
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				vo = new BoardVO();
				
				vo.setNum(rs.getInt("num"));
				vo.setAuthor(rs.getString("author"));
				vo.setTitle(rs.getString("title"));
				vo.setWriteday(rs.getString("writeday"));
				vo.setReadcnt(rs.getInt("readcnt"));
				vo.setRepRoot(rs.getInt("repRoot"));
				vo.setRepStep(rs.getInt("repStep"));
				vo.setRepIndent(rs.getInt("repIndent"));
				
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
	* boardInsert() 메서드: 게시물 등록
	* @return boolean 리턴.
	***********************************************************/
	public boolean boardInsert(BoardVO vo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			conn = getConnection();
 
			StringBuffer sql = new StringBuffer();
			sql.append("insert into board(num,author,title,content,reproot,repstep,repindent,passwd) ");
			sql.append("values (board_seq.nextval,?,?,?,board_seq.currval,0,0,?)");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getAuthor());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getPasswd());
			
			if(pstmt.executeUpdate() == 1) {
				result=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(conn);
		}
		return result;
	}

	/***********************************************************
	* readCount() 메서드: 조회수 증가 처리 메서드.
	* @param 게시물 번호. 
	***********************************************************/
	public void readCount(String num){
		
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
        	conn = getConnection();

    	    StringBuffer sql = new StringBuffer();
            sql.append("update board set readcnt = readcnt+1 ");
            sql.append("where num = ?");
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, Integer.parseInt(num));
            pstmt.executeUpdate();
            
        } catch (SQLException e){
            e.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
			close(pstmt);
			close(conn);
			System.out.println("BoardDAO readCount() success");
        }
	}

	/***********************************************************
	* boardDetail() 메서드: 상세 페이지 처리 메서드.
	* @param 게시물 번호. 번호를 숫자로 받은 이유는 필요시 변환하여 사용하기 때문에.
	* @return BoardVO 리턴
	***********************************************************/
	public BoardVO boardDetail(String num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO vo = new BoardVO();
		
		try {
			conn = getConnection(); 
			StringBuffer sql = new StringBuffer();
			sql.append("select num,author,title,content, ");
			sql.append("to_char(writeday,'YYYY-MM-DD HH24:MI:SS') writeday, ");
			sql.append("readcnt, reproot, repIndent,repStep ");
			sql.append("from board where num = ? ");
	        
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(num));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				vo.setNum(rs.getInt("num"));
				vo.setTitle(rs.getString("title"));
				vo.setAuthor(rs.getString("author"));
				vo.setContent(rs.getString("content"));
				vo.setWriteday(rs.getString("writeday"));
				vo.setReadcnt(rs.getInt("readcnt"));
				vo.setRepRoot(rs.getInt("reproot"));
				vo.setRepStep(rs.getInt("repStep"));
				vo.setRepIndent(rs.getInt("repIndent"));
				
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
	* boardUpdate() 메서드: 게시물 수정 처리 메서드.
	* @return boolean 리턴.
	***********************************************************/
	
	public boolean boardUpdate(BoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean success = false;
		
		try {
			conn = getConnection(); 
			
			StringBuffer sql = new StringBuffer();
			sql.append("update board set title= ?, content=? ");
			if(vo.getPasswd() !="") sql.append(", passwd= ? "); //비밀번호를 적지 않았을 때는 이 코드가 실행되지않게
			sql.append("where num = ?");
	        
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());

			if(vo.getPasswd() != "") {
				pstmt.setString(3, vo.getPasswd());
				pstmt.setInt(4, vo.getNum());
			}else	
				pstmt.setInt(3, vo.getNum());
			
			if(pstmt.executeUpdate() == 1) success=true;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(conn);
		}
		return success;
	}
	
	/***********************************************************
	* boardDelete() 메서드: 게시물 삭제 처리 메서드.
	* @param 게시물 번호. 번호를 숫자로 받은 이유는 필요시 변환하여 사용하기 때문에.
	***********************************************************/
	public void boardDelete(String num){
		
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
        	conn = getConnection();   
        	
        	StringBuffer sql = new StringBuffer();
            sql.append("delete from board where num = ?");
            
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

	
	
	/***********************************************************
	* boarPasswdChk() 메서드: 비밀번호 확인 메서드
	* @param 게시물 번호, 비밀번호.
	* @return int 리턴.
	***********************************************************/
	public int boardPasswdChk(String num, String pw) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection(); 
			
			StringBuffer sql = new StringBuffer();
			sql.append("select nvl((select 1 from board where num = ? ");
			sql.append("and passwd=?),0) as result from dual ");
		
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

	public void makeReply(int root, int step) {
		 Connection conn = null;
	        PreparedStatement pstmt = null;

	        try {
	        	conn = getConnection();   
	        	
	        	StringBuffer sql = new StringBuffer();
	            sql.append("update board set repstep = repstep + 1 ");
        		sql.append("where reproot = ? and repstep > ? " );
	            
	            pstmt = conn.prepareStatement(sql.toString());  
	            pstmt.setInt(1, root);
	            pstmt.setInt(2, step);
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
	public boolean replyInsert(BoardVO vo) {
		
		makeReply(vo.getRepRoot(),vo.getRepStep());
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			conn = getConnection();
 
			StringBuffer sql = new StringBuffer();
			sql.append("insert into board(num,author,title,content,reproot,repstep,repindent,passwd) ");
			sql.append("values (board_seq.nextval,?,?,?,?,?,?,?)");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, vo.getAuthor());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getRepRoot());
			pstmt.setInt(5, vo.getRepStep() +1);
			pstmt.setInt(6, vo.getRepIndent() +1);
			pstmt.setString(7, vo.getPasswd());
			
			if(pstmt.executeUpdate() == 1) {
				result=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			result = false;
		}finally {
			close(pstmt);
			close(conn);
		}
		return result;
	}

	
}
