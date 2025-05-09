<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>엑셀로 상품업로드</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>

<jsp:include page="menu.jsp" />

<div class="container mt-5">
    <h2>엑셀 파일로 상품 업로드</h2>
    <form action="<%= request.getContextPath() %>/uploadExcel" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="excelFile">엑셀 파일 선택:</label>
            <input type="file" name="excelFile" id="excelFile" class="form-control" accept=".xlsx, .xls" required>
        </div>
        <button type="submit" class="btn btn-primary mt-3">업로드</button>
    </form>
</div>

</body>
</html>
