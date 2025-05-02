<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Redirect Page</title>
</head>
<body>
    <h2>Redirect로 이동했습니다.</h2>
    <p>요청한 moveType 값: <%= request.getParameter("moveType") %></p>
    <p>현재 URL: <%= request.getRequestURI() %></p>
</body>
</html>
