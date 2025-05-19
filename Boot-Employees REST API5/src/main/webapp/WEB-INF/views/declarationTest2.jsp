<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 선언문 예제-메소드선언</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<h2>선언문 예제-메소드 선언 </h2>
			<%!
			String id = "Kingdora";

			public String getId() {
				return id;
			}
			%>
			<%@include file="top.jsp"%>
			id 변수의 내용: <%=id%><br>
			getId 메소드의 실행결과:<%=getId()%>
			<%@include file="bottom.jsp"%>		
			
	</body>
</html>
		