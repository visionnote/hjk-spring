<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>member 테이블 레코드 수정</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>
			<h2>member 테이블 레코드 수정 </h2>
			
			<form method="post" action="updateTestPro">
				아이디: <input type="text" name="id" maxlength="50"><br>
				패스워드: <input type="text" name="passwd" maxlength="16"><br>
				변경할 이름: <input type="text" name="name" maxlength="10"><br>
				<input type="submit" value="입력완료">
			</form>

			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		