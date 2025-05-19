<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 디렉티브 연습- include</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<h2> 디렉티브 연습-include</h2>
			<%
			String name="Kim";
			%>
			<%@include file="top.jsp"%>
			<p>포함하는 페이지 directiveInclude.jsp의 내용입니다.<p>
			<%@include file="bottom.jsp"%>		
			
	</body>
</html>
		