<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>for</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>
			<h2>JDBC 드라이버 테스트</h2>
			<%
				java.util.Locale.setDefault(java.util.Locale.ENGLISH);
			%>
			<%
			Connection conn = null;
			try{
				String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
				String dbId = "jspid";
				String dbPass="jsppass";

				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
				out.println("제대로 연결되었습니다.");
			} catch(Exception e) {
				e.printStackTrace();
			}
			%>
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		