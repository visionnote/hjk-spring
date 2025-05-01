<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration" %>
<html>
	<head>
		<title>Form Processing</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String sex = request.getParameter("sex");

			String[] hobby = request.getParameterValues("hobby");
			String comment = request.getParameter("comment");
					
		%>
		
		<p>아이디:<%=id%>
		<p>비밀번호:<%=passwd%>
		<p>이름:<%=name%>
		<p>연락처:<%=phone1%>-<%=phone2%>-<%=phone3%>
		<p>성별:<%=sex%>
    	<p>취미:<%-- <%=hobby1%><%=hobby2%><%=hobby3%> --%>
	    <p>취미 : <%
			if(hobby != null) {
				for(int i = 0; i<hobby.length; i++)  {
					out.println(" "+hobby[i]);
				}
			}
			%>
			<%
			String[] hobbies = request.getParameterValues("hobby");
			if (hobbies != null) {
			        for (String h : hobbies) {
			            out.println("선택한 취미: " + h + "<br>");
			        }
			    } else {
			        out.println("선택한 취미가 없습니다.");
			    }
				%>
		<p>가입 인사:<%=comment%>
			<table border="1">
			<tr>
				<th>요청 파라미터 이름</th>
				<th>요청 파라미터 값</th>
			</tr>			
			<%
			 request.setCharacterEncoding("UTF-8");
			 Enumeration paramNames = request.getParameterNames();
			 
			 while(paramNames.hasMoreElements()){
				String name2 = (String) paramNames.nextElement();
				out.print("<tr><td>"+name2+" </td>\n");
				
				String paramValue = request.getParameter(name2);

				out.println("<td> "+paramValue+"</td></tr>\n");
				
			 }
			%>
			<%
			if(hobby != null) {
											for(int i = 0; i<hobby.length; i++)  {
												out.println("<tr><td>"+"취미"+i+"</td>\n"+"<td>"+hobby[i]+"</td></tr>\n");
											}
										}
			%>
			
			</table>
</body>
</html>			