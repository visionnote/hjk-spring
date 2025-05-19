<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Script 예제</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<h2>선언문,스크립트릿,표현식의 쓰임을 알아보는 예제</h2>
			<%!  //선언문-전역변수 선언 
			String name="전역변수입니다.";
			%>
			<%! //선언문-메소드 선언
			 String getName() {
				return name;
			 }
			%>
			<% //스크립트릿
			   String name2="지역 변수입니다.";
			%>
			<%@include file="top.jsp"%>
			스크립트릿에서 선언한 변수 name2는 <%=name2 %><br><!--표현식-->
			선언문에서 선언한 변수 name은 <%=getName()%><!--표현식-->
			<%@include file="bottom.jsp"%>		
	</body>
</html>
		