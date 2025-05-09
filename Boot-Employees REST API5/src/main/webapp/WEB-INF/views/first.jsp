<%@ page contentType="text/html; charset=utf-8"%>
<html>
    <head>
        <title>Action  Tag</title>
    </head>
<body>
    <h3>이 파일은 first.jsp입니다.</h3>
    <jsp:include page="second.jsp">
        <jsp:param name="date" value="<%=new java.util.Date()%>" />
    </jsp:include>
    <p>Java Server Page</p>
    <jsp:useBean id="date" class="java.util.Date" />
    <p><%
        out.print("오늘의 날짜 및 시각");
        %>
    </p><%=date%>
    <br/>
    <jsp:useBean id="bean" class="com.example.myapp.dao.Calculator" />
    <%
      int m = bean.process(5);
      out.print("5의 3제곱 : " + m);
    %>
    <h2>예1</h2>
    <jsp:useBean id="person" class="com.example.myapp.dao.Person" scope="request" />
    <p>아이디:<%=person.getId()%></p>
    <p>이름:<%=person.getName()%></p>

    <h2>예2</h2>
    <% person.setId(20182005);
       person.setName("홍길동");
    %>
    <p>아이디:<%=person.getId()%></p>
    <p>이름:<%=person.getName()%></p>
    
    <h2>예3</h2>
    <jsp:setProperty name="person" property="id" value="20172005" />
    <jsp:setProperty name="person" property="name" value="허균" />
    <p>아이디:<%=person.getId()%></p>
    <p>이름:<%=person.getName()%></p>

    <h2>예4</h2>
    <jsp:setProperty name="person" property="id" value="20162005" />
    <jsp:setProperty name="person" property="name" value="허난설헌" />
    <p>아이디:<jsp:getProperty name="person" property="id" /></p>
    <p>이름:<jsp:getProperty name="person" property="name" /></p>

</body>
</html>
