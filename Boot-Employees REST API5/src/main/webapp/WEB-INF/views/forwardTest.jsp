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
			<h2>forward 요청</h2>
			포워딩하는 페이지는 forardTest.jsp로 표시되지 않습니다.
			<jsp:forward page="forwardToTest.jsp"/>
			forwardTest.jsp 페이지의 나머지 부분으로 표시도 실행도 되지 않습니다. 
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		