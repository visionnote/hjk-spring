<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>표현식예제-레퍼런스 타입 출력</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<h2>표현식 예제-레퍼런스 타입 출력</h2>
			
			<%@include file="top.jsp"%>
			<%
			StringBuffer sf = new StringBuffer("Reshiram");
			sf.reverse();
			out.println("객체의 내용:" + sf.toString());
			%>
			<%@include file="bottom.jsp"%>		
			
	</body>
</html>
		