<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 디렉티브 연습- include</title>
        <link rel="stylesheet" href="/css/style.css">
		<%@ page import="java.time.LocalTime" %>
		<%
			LocalTime now = LocalTime.now();
			String bgColorClass = "";

			//1분마다 바뀌는 시간을 위해 분과 초도 따로 받아둠 2025-05-19
			int minute = now.getMinute();
   			int hour = now.getHour();

			if (now.isAfter(LocalTime.of(6, 0)) && now.isBefore(LocalTime.of(12, 0))) {
				// 아침 6시 ~ 12시
				bgColorClass = "morning-bg";
			} else if (now.isAfter(LocalTime.of(12, 0)) && now.isBefore(LocalTime.of(18, 0))) {
				// 낮 12시 ~ 18시
				bgColorClass = "afternoon-bg";
			} else if (now.isAfter(LocalTime.of(18, 0)) && now.isBefore(LocalTime.of(21, 0))) {
				// 저녁 18시 ~ 21시
				bgColorClass = "evening-bg";
			} else {
				// 밤 21시 ~ 아침 6시
				bgColorClass = "night-bg";
			}
		%>
	</head>
	<body class="<%= bgColorClass %>">
		<h1>시간에 따라 배경색이 바뀌는 페이지</h1>
	<div class="clock">
        <span id="hour"><%= String.format("%02d", hour) %></span> : 
        <span id="minute"><%= String.format("%02d", minute) %></span>
    </div>

    <script>
        function updateTime() {
            const now = new Date();
            const hours = now.getHours();
            const minutes = now.getMinutes();
            document.getElementById("hour").textContent = String(hours).padStart(2, "0");
            document.getElementById("minute").textContent = String(minutes).padStart(2, "0");
        }

        setInterval(updateTime, 60000); // 1분마다 시간 갱신
    </script>
	<div class="top-container">
			<%
				   LocalDate now2 = LocalDate.now();
			       DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			       String strDate2 = now2.format(formatter2);
			%>	   
			top.jsp입니다<p>
			<%=" 오늘날짜는 " + strDate2 + " 입니다. "%>
	</div>
	</body>
</html>
		