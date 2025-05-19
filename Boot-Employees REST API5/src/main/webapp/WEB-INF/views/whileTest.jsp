<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>권역을 선택하는 폼</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>	
			<p>
			<%
			int i = 0;

			while(i<10) {   //0~9까지 값이 출력된다.
				out.println("출력되는값: "+i+"<br>");
				i++;
			}
			%>

			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		