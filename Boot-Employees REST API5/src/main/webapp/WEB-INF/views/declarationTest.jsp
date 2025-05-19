<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 선언문 예제-변수선언</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<h2> 디렉티브 연습-include</h2>
			<%
			String str1= str2+"Server Page";
			%>
			<%! 
			String str2 = "Java";
			%>
			<%@include file="top.jsp"%>
			<p>출력결과: <%=str1%><p>
			<%@include file="bottom.jsp"%>		
			
	</body>
</html>
		