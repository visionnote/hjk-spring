<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키 생성</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>
			<h2>쿠키를 생성하는 페이지 </h2>
			<%
			 String cookieName = "id";
			 Cookie cookie = new Cookie(cookieName, "hongkd");
			 String cookieName2 = "id2";
			 Cookie cookie2 = new Cookie(cookieName2, "hongkd2");
			 cookie.setMaxAge(60*2);
			 cookie2.setMaxAge(60*2);
			 response.addCookie(cookie);
			 response.addCookie(cookie2);
			%>
			"<%=cookieName%>" 쿠키가 생성되었습니다. <br>
			"<%=cookieName2%>" 쿠키가 생성되었습니다. <br>
			<form method="post" action="useCookie">
				<input type="submit" value="생성된 쿠키 확인">
			</form>
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		