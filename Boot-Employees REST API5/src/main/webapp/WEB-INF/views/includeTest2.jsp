<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>include 액션태그</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>
			<%
			 String name = "홍길동";
			 String pageName = "includedTest2.jsp";
			 %>
			 포함하는 페이지 includeTest2.jsp 입니다.<br>
			 포함되는 페이지에 파라미터 값을 전달합니다.<br>
			 <hr>
			<jsp:include page="<%=pageName%>" flush="false">
				<jsp:param name="name" value="<%=name%>" /> 
				<jsp:param name="pageName" value="<%=pageName%>"/> 
			</jsp:include>
			includeTest2.jsp의 나머지 내용입니다. 
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		