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
			String pageName=request.getParameter("pageName");
			pageName += ".jsp";
			%>
			포함하는 페이지 includeTest.jsp 입니다.
			<hr>
			<jsp:include page="<%=pageName%>" flush="false"/>
			includeTest.jsp의 나머지 내용입니다. 
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		