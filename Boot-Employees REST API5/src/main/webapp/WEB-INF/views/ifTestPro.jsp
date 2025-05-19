<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 입력하는 숫자 비교</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			
			<%@include file="top.jsp"%>
			
			<form method="post" action="ifTestPro">
			<h2> 입력받은 숫자가 10보다 작거나 같은 지 비교 </h2>
				<%
				String strNumber = request.getParameter("number");
				int number=Integer.parseInt(strNumber);

				if(number<=10) {

				%>
				입력받은 숫자는 <%=number %> 입니다.
				<p>
				<%}%>

			<%@include file="bottom.jsp"%>		
	</body>
</html>
		