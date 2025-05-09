<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>엑셀 파일 업로드</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>엑셀 파일로 상품 등록</h1>
        <form action="/uploadExcel" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="excelFile">엑셀 파일 선택</label>
                <input type="file" class="form-control" id="excelFile" name="excelFile" required>
            </div>
            <button type="submit" class="btn btn-primary">업로드</button>
        </form>
    </div>
</body>
</html>
