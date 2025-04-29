<%@ page contentType="text/html; charset=utf-8"%>
<html>
	<head>
	<title>Implicit Objects</title>	
	<!--request.setCharacterEncoding("utf-8");-->
	</head>
	<body>
		<%
		String name = request.getParameter("name");
		%>
		<p>이 름2:<%=name%>	
	</body>
</html>