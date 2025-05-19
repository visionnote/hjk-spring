<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
	<head>
		<meta charset="UTF-8">
		<title>Response 내장 객체 예제</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
		<%@include file="top.jsp"%>
		<h2>Response 내장 객체-리디아렉트 예제</h2>
		현재 페이지는 <b>ResponseRedirect.jsp</b>페이지입니다.
		<%
		response.sendRedirect("responseRedirected");
		%>
		
		<p>
		<%@include file="bottom.jsp"%>
	</body>
</html>
		