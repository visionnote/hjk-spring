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
			<h2>입력한 이름과 전화번호를 확인하세요.</h2>
			<%
			 String name  = request.getParameter("name");
			 String local = request.getParameter("local");
			 String tel = request.getParameter("tel");
			 String localNum = "";

			 if(local.equals("서울")) {  //local 변수의 값이 서울일 경우
			 	localNum = "02";
			 } else if(local.equals("경기")) {  //local 변수의 값이 경기일 경우
			 	localNum = "031";
			 } else if(local.equals("강원")) {  //local 변수의 값이 강원일 경우
			 	localNum = "033";
			 }
			 out.println("<b>" + name + " </b> 님의 전화번호는" 
				 + localNum + "-" + tel + "입니다");
			%>
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		