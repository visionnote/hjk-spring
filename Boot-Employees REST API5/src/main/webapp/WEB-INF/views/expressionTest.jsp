<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>표현식예제-배열의 특정 요소의 내용 출력</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<h2> 디렉티브 연습-include</h2>
			<%
			//배열의 초기화 블록을 사용하면 배열의 선언, 메모리 할당, 초기값 설정을 한 번에 할 수 있다. 
				String[] str = {"JSP", "JAVA", "Android", "HTML5"};
				int i = (int) (Math.random() * 4); // 0~3 사이의 랜덤 값
			%>
			<%@include file="top.jsp"%>
			<%=str[i]%>가(이) 재미있다. 
			<%@include file="bottom.jsp"%>		
			
	</body>
</html>
		