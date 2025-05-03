<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.upload.UploadedFile" %>
<%
    List<UploadedFile> fileList = (List<UploadedFile>) request.getAttribute("fileList");
    if (fileList != null && !fileList.isEmpty()) {
%>
    <table border="1" cellpadding="5">
        <tr>
            <th>파일명</th>
            <th>업로드 시간</th>
            <th>미리보기</th>
            <th>다운로드</th>
            <th>삭제</th>
        </tr>
        <% for (UploadedFile file : fileList) { 
               String fileName = file.getFileName();
               String lowerFileName = fileName.toLowerCase();
               boolean isImage = lowerFileName.endsWith(".jpg") || lowerFileName.endsWith(".jpeg") || 
                                 lowerFileName.endsWith(".png") || lowerFileName.endsWith(".gif");
        %>
        <tr>
            <td><%= fileName %></td>
            <td><%= file.getUploadedAt() %></td>
            <td>
                <% if (isImage) { %>
                    <img src="/download?filename=<%= fileName %>" width="100" height="100" />
                <% } else { %>
                    (이미지 아님)
                <% } %>
            </td>
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
