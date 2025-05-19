<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 값을 입력하는 폼</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			
			<%@include file="top.jsp"%>
			
			<form method="post" action="ifTestPro">
			<h2> 숫자값을 입력하세요 </h2>
				<input type="text" name="number">
				<input type="submit" value="입력완료">
			</form>
			<p>
			<%@include file="bottom.jsp"%>		
	</body>
</html>
		