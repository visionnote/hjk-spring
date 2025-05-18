<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>page 디렉티브 연습-import 속성</title>
		</head>
		<body>
			<h2>page 디렉티브연습-import 속성</h2>
			<%
				Timestamp now = new Timestamp(System.currentTimeMillis());
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				String strDate = format.format(now);

			%>
			<%= "오늘날짜1:"+strDate %>
			<br>
			<%
				   LocalDate now2 = LocalDate.now();
			       DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			       String strDate2 = now2.format(formatter);
			       
			%>	   
			<%= "오늘날짜2:"+strDate2 %>
			<br>
			<%
			 Date today = new Date();
			 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			 String todayStr = dateFormat.format(today);
			 out.print("오늘 날짜3:"+todayStr); 
			 %>
			</body>
		</html>
		