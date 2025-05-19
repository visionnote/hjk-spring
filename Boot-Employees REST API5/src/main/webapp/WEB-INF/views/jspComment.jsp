<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> HTML 주석 예제 </title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<h2> HTML 주석 예제 </h2>
			<%
			String str = "소스보기를 하면 화면에 표시됩니다.";
			%>
			<%@include file="top.jsp"%>
			<%-- HTML 주석입니다. --%>
			<%-- <%=str%> --%>
			<%@include file="bottom.jsp"%>		
	</body>
</html>
		