<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레코드 조회</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>
			<h2>member 테이블 레코드 조회</h2>
			<table border="1">
			<tr>
			 <td width="100" align="center">아이디</td>
			 <td width="100" align="center">패스워드</td>
			 <td width="100" align="center">이름</td>
			 <td width="250" align="center">가입일자</td>
			</tr>
			<%
					
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String str = "";
			
			try {
				String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
				String dbId="jspid";
				String dbPass="jsppass";

				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);

				String sql="select * from member";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					String id = rs.getString("id");
					String passwd = rs.getString("passwd");
					String name = rs.getString("name");
					Timestamp register = rs.getTimestamp("reg_date");
			%>
			<tr>
				<td width="100" align="center"><%=id%></td>
				<td width="100" align="center"><%=passwd%></td>
				<td width="100" align="center"><%=name%></td>
				<td width="250" align="center"><%=register.toString()%></td>
			</tr>
			<%
				}
				str = "member table 조회가 완료되었습니다.";
			}
			catch(Exception e) {
				e.printStackTrace();
				str="member 테이블 조회를 실패했습니다.";
			} finally {
				if(rs != null) 
				try{rs.close();}
				catch(SQLException sqle){};

				if(pstmt != null) 
				try{pstmt.close();}
				catch(SQLException sqle){};

				if(conn != null) 
				try{conn.close();}
				catch(SQLException sqle){};
			}
			%>
			</table>
			<%=str%>
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		