<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이름과 나이를 입력하는 폼</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>	
			<h2>이름과 나이를 입력하세요.</h2>
			<form method="post" action="ifElseTestPro">
				이름: <input type="text" name="name"><br>
			    나이: <input type="text" name="age"><br>
				<input type="submit" value="입력완료">
			</form>
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		