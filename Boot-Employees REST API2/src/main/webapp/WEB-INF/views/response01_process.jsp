<%@ page contentType="text/html;charset=utf-8"%>
<html>
	<head>
		<title>Implicit Object</title>
	</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("id");
		String password = request.getParameter("passwd");
		
		if(userid.equals("관리자") && password.equals("1234")) {
			response.sendRedirect("/response01_success");
		} else { 
			response.sendRedirect("/response01_failed");	
		}
	%>
	
</body>
</html>