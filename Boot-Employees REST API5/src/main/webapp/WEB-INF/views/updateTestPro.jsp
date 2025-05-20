<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>member 테이블 레코드 변경</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>
			<h2>member 테이블 레코드 변경</h2>
			
			<%
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			Timestamp register = new Timestamp(System.currentTimeMillis());
			Timestamp modifier = new Timestamp(System.currentTimeMillis());
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String str;
			try {
				String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
				String dbId="jspid";
				String dbPass="jsppass";

				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);

				String sql = "UPDATE member "
				+ "SET name = ?, mod_date = ? "
				+ "WHERE id = ? AND passwd = ?";
			try (pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, name);
				pstmt.setTimestamp(2, modifier);
				pstmt.setString(3, id);
				pstmt.setString(4, passwd);

				int updated = pstmt.executeUpdate();
				if (updated == 1) {
					str = "회원 정보를 변경했습니다.";
				} else {
					str = "아이디 또는 패스워드를 확인하세요.";
				}
}
			} catch(Exception e) {
				e.printStackTrace();
				str="member 테이블 레코드 변경에 실패했습니다.";
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
			<%=str%>
			<p>

			<%@include file="bottom.jsp"%>
	</body>
</html>
		