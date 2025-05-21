<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>member 테이블 레코드 삭제</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>
			<h2>member 테이블 레코드 삭제</h2>
			
			<%
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
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

				String sql="select id, passwd from member where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				rs = pstmt.executeQuery();

				if(rs.next()) {
					String rId = rs.getString("id");
					String rPasswd = rs.getString("passwd");
					if(id.equals(rId) && passwd.equals(rPasswd)) {
						sql = "delete from member where id =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,id);
						pstmt.executeUpdate();
				str = "member 테이블 레코드를 삭제했습니다.";
				
					} else 
					str = "패스워드를 확인하세요.";
				} else
				str = "아이디를 확인하세요.";		
			} catch(Exception e) {
				e.printStackTrace();
				str="member 테이블 레코드 삭제에 실패했습니다.";
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
		