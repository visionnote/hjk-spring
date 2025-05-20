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
			<h2>include 액션태그</h2>
			<form method="post" action="includeTest">
				이름: <input type="text" name="name"><br>
				페이지이름: <input type="text" name="pageName" value="includedTest"><br>
				<input type="submit" value="입력완료">										
			</form>
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		