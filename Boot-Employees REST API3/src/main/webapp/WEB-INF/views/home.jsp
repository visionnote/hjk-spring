<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>홈</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="menu.jsp" />

<div class="jumbotron text-center">
    <h1 class="display-4">상품 관리 시스템</h1>
    <p class="lead">상품 등록, 조회, 수정, 삭제를 할 수 있는 간단한 시스템입니다.</p>
    <a href="<%= request.getContextPath() %>/products" class="btn btn-primary btn-lg">상품 목록 보기</a>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
