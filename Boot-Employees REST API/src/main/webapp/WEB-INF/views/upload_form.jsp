<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>파일 업로드</title>
</head>
<body>
<h2>파일 업로드</h2>
<form method="post" action="/upload_result" enctype="multipart/form-data">
    <input type="file" name="file"/>
    <input type="submit" value="업로드"/>
</form>
</body>
</html>
