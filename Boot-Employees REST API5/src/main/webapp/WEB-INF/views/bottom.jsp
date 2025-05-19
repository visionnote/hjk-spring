<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> bottom.jsp </title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
		<div class="bottom-container">
			bottom.jsp입니다<p>
			<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
			<%
				LocalDateTime now3 = LocalDateTime.now();
				DateTimeFormatter dateFormatter3 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				DateTimeFormatter timeFormatter3 = DateTimeFormatter.ofPattern("a HH:mm:ss");
				String formattedDate = now3.format(dateFormatter3);
				String formattedTime = now3.format(timeFormatter3);
			%>

			<p>지금 시각은: 
				<span class="date-color"><%= formattedDate %></span> 
				<span class="time-color"><%= formattedTime %></span> 입니다.
			</p>
		</div>
	</body>
</html>
		