<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>include 액션태그</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%
			String name = request.getParameter("name");
			%>
			포함되는 페이지 includedTest.jsp 입니다.<p>
			<b><%=name%></b>님 안녕하세요.
			<hr>
			<p>
	</body>
</html>
		