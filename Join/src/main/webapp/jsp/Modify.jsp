<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession hs = request.getSession();
%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      
      <link rel="shortcut icon" href="../img/heart.svg" />
      <link rel="apple-touch-icon" href="../img/heart.svg" />
      <script type="text/javascript" src="../js/jquery-3.6.2.min.js"></script>
      <script type="text/javascript" src="../js/euna`s.js"></script>
      <title>modify.html</title>
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
 		<style type="text/css">
		  	.wheat{
		  		background-color: wheat;
		  	}
		  	td>input,select{
		  		text-align: center;
		  		border : none;
		  		background-color: #fffaf0;
		  	}
		  	.inputCenter{
		  		text-align: center;
		  	}
		  	.center{
		   		display:flex;
		   		justify-content:center;
		   		align-items: center;
	   		}
	  		table *{
		   		padding:10px;
		   		border-collapse: collapse;
		   		border-bottom: 1px dotted wheat;
		   		text-align: left;
	    	}
		 </style>
   </head>
   <body>
   		<!--  변수 -->
   		<%!
   			Connection con;
			Statement sm;
			ResultSet rs;
   			String name,id,pw,contact1,contact2, contact3, gender;
   		%>
   		<!--DB연동 -->
   		<%!
   			private static final String JDBC_URL = "jdbc:oracle:thin:@127.0.0.1:1521/xepdb1";
		    private static final String USER = "c##javauser";
		    private static final String PASSWD = "java1234";
		    private static final String CLASSNAME = "oracle.jdbc.driver.OracleDriver";
   		%>
   		<%
			
			id =(String)hs.getAttribute("id");
   			String query = "select * from member where id='"+id+"'";
   			
   				Class.forName(CLASSNAME);
   				con = DriverManager.getConnection(JDBC_URL,USER,PASSWD);
   				sm = con.createStatement();
   				rs = sm.executeQuery(query);
   				
   				while(rs.next()){
   					name = rs.getString("name");
   					pw = rs.getString("pw");
   					contact1 = rs.getString("contact1");
   					contact2 = rs.getString("contact2");
   					contact3 = rs.getString("contact3");
   					gender = rs.getString("gender");
   				}
   			%>
   			<h1 class='wheat inputCenter'>MODIFY</h1>
   		<form action="/Join/modify" method="post">
   			<table class='center' id='modify'>
   				<tr>
   					<th>NAME</th>
   					<td><input type='text' name='name' id='name' size='20' value=<%=name%>></td>
   				</tr>
   				<tr>
   					<th>ID</th>
   					<td><input type='text' name='id' id='id' size='20' value=<%=id%> readonly="readonly"></td>
   				</tr>
   				<tr>
   					<th>PW</th>
   					<td><input type="password" name='pw' id='pw' size='20' value=<%=pw%>></td>
   				</tr>
   				<tr>
   					<th>CONTACT</th>
   					<td>
   						<select name='contact1'>
   							<option value='010'>010</option>
   							<option value='011'>011</option>
   							<option value='016'>016</option>
   						</select>
   						-
   						<input type='text' name='contact2' size='5' value=<%=contact2%> >
   						-
   						<input type='text' name='contact3' size='5' value=<%=contact3%> ><br />
					</td>
   				</tr>
   				<tr>
   					<th>GENDER</th>
   					
   					<td>
	   					<%
	   					try{
	   						if(gender.equals("male")){
	   					%>
   							<label><input type="radio" name='gender' id='M' size='10' value='male' checked="checked"  />MALE</label>
   							<label><input type="radio" name='gender' id='W' size='10' value='female' />FEMALE</label>
	   					<%	
	   						}else{
	   					%>
   							<label><input type="radio" name='gender' id='M' size='10' value='male' />MALE</label>
   							<label><input type="radio" name='gender' id='W' size='10' value='female' checked="checked" />FEMALE</label>
   						<%	}
	   					}catch(NullPointerException e){
	   						e.printStackTrace();
	   						
	   					%>
	   						<label><input type="radio" name='gender' id='M' size='10' value='male' />MALE</label>
   							<label><input type="radio" name='gender' id='W' size='10' value='female' />FEMALE</label>
	   					<%
	   					}
	   					%>
   					</td>
   				</tr>
   				<tr>
   					<td colspan="2" class='inputCenter'>
   						<input type="submit" value="MODIFY" />
   						<input type="reset" value="CANCEL" />
   					</td>
   				</tr>
   			</table>
		</form>
   		
   </body>
</html>