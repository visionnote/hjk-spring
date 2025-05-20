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
			String id = "Kingdora";
			String hobby = "만화보기";
			%>

			포워딩하는 페이지 forwardTest2.jsp입니다.<br>
			<jsp:forward page="forwardToTest2.jsp">
				<jsp:param name="id" value="<%=id%>"/>
				<jsp:param name="hobby" value="<%=hobby%>"/>
			</jsp:forward>

			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		