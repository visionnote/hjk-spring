<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>웹 브라우저에 저장된 쿠키를 가져오기</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>
			<h2>웹 브라우저에 저장된 쿠키를 가져오는 페이지</h2>
			<%
			 Cookie[] cookies = request.getCookies();
			 if(cookies != null) {
				for(int i=0; i<cookies.length; ++i) {
					if(cookies[i].getName().equals("id")) {
						%>
						쿠키의 이름은 "<%=cookies[i].getName()%>" 이고 
						쿠키의 값은 "<%=cookies[i].getValue()%>" 입니다.<br>
						<%
					} 
					if(cookies[i].getName().equals("id2")) {
						%>
						쿠키의 이름은 "<%=cookies[i].getName()%>" 이고 
						쿠키의 값은 "<%=cookies[i].getValue()%>" 입니다.<br>
						<%
					} 
					
				}
			 }
			 %>
			 	<p>

			<%@include file="bottom.jsp"%>
	</body>
</html>
		