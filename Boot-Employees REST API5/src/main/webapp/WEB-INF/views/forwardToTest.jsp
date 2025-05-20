<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>for</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>
			<%
			String id = request.getParameter("id");
			String hobby = request.getParameter("hobby");
			%>
			<h2>forwarding 페이지 : forwardToTest.jsp</h2>
			포워딩되는 페이지는 forwardToTest.jsp 입니다.<br>
			<b><%=id%></b>님의<br>
			취미는<b><%=hobby%></b>입니다. 
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		