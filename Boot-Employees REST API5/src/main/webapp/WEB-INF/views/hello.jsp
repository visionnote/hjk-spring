<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Hello JSP</title>
</head>

<body>
    <%! int count =0;%>
    <%! int data = 50;%>
    <%! int sum(int a, int b) {
        return a + b;
    } %>
    <%! String makeItLower(String data) {
        return data.toLowerCase();
    }
    %>
    <%! String greeting = "Welcome to Web Shopping Mall";
        String tagline = "Welcome to Web Market!"; %>

    안녕하세요! 
    <h1>Hello from JSP!</h1>
    <h1><%= greeting%></h1>
    <h3><%= tagline%></h3>
    <c:out value="JSTL Core 태그 라이브러리" /> 
    <c:forEach var="k" begin="1" end="10" step="1">
        <c:out value="${k}" />
    </c:forEach>
    Page Count is 
    <%
     out.println(++count);
     %>
     <br/>
     Page count is <%= ++count %>
     <br/>
     <%out.println("Value of the variable is:" + data);%>
     <br/>
     <%out.println("2 + 3 = " + sum(2,3));%>
     <br/>
     <%out.println(makeItLower("Hello World"));%>
     <br/>
     <%
       int a = 2;
       int b = 3;
       int sum = a + b;
       out.println("2+3="+sum);
      %>
      <br/>
      <%
       for (int i = 0; i<=10 ; i++) {
        if(i % 2 == 0) 
            out.println(i + "<br>");
       }
       %>
       <p> Today's date : <%=new java.util.Date() %></p>
       <!-- 주석-->
       <%-- 주석--%>
       <p><%= a + b + data%> </p>
</body>
</html>
