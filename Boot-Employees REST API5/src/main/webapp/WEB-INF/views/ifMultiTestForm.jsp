<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이름과 전화번호를 입력하는 폼</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>	
			<h2>이름과 전화번호를 입력하세요.</h2>
			<form method="post" action="ifMultiTestPro">
				이름: <input type="text" name="name"><br>
			   
			   <select name="local">
			   	<option value="서울">서울</option>
			    <option value="경기">경기</option>
				<option value="강원">강원</option>
			   </select>
			   -<input type="text" name="tel"><br>
			   <input type="submit" value="입력완료">
			</form>
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		