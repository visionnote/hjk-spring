<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>업로드된 파일 목록</title>
</head>
<body>
<h2>업로드된 파일 목록</h2>

<%
    List<String> fileList = (List<String>) request.getAttribute("fileList");
    if (fileList != null && !fileList.isEmpty()) {
%>
    <table border="1" cellpadding="5">
        <tr>
            <th>파일명</th>
            <th>다운로드</th>
            <th>삭제</th>
        </tr>
        <% for (String fileName : fileList) { %>
        <tr>
            <td><%= fileName %></td>
            <td><a href="/download?filename=<%= fileName %>">다운로드</a></td>
            <td>
                <form method="post" action="/delete" style="display:inline;">
                    <input type="hidden" name="filename" value="<%= fileName %>"/>
                    <button type="submit">삭제</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
<% } else { %>
    <p>업로드된 파일이 없습니다.</p>
<% } %>

<br/>
<a href="/upload_form">파일 업로드 페이지로 이동</a>
</body>
</html>
