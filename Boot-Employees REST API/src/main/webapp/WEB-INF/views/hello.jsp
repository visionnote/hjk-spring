<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello JSP</title>
</head>
<%! int count =0;%>
<%! int data = 50;%>
<body>
    안녕하세요! 
    Page Count is 
    <h1>Hello from JSP!</h1>
    <%
     out.println(++count);
     out.println("Value of the variable is:" + data);
     %>
</body>
</html>
