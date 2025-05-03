<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<html>
<head>
    <title>업로드 결과</title>
</head>
<body>
<h2>업로드된 파일 목록</h2>
<% 
  List<String> uploadedFiles = (List<String>) request.getAttribute("uploadedFiles");
  if(uploadedFiles != null && !uploadedFiles.isEmpty()) {
 %>
   <ul>
	<% for (String fileName : uploadedFiles) { %>
	<li><%=fileName %></li>
	<li>
	     <a href="/download?filename=<%= fileName %>"><%= fileName %> 다운로드</a>
	 </li>
	<% } %>
   </ul>
   <ul>
       <% for (String fileName : uploadedFiles) { %>
           <li>
               <a href="/download?filename=<%= fileName %>"><%= fileName %> 다운로드</a>
           </li>
       <% } %>
   </ul>

   <% } else { %>
       <p>업로드된 파일이 없습니다.</p>
   <% } %>
   <a href="/upload_form">다시 업로드하기</a>
</body>
</html>
