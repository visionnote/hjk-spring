<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/home">상품 관리</a>
        <div class="d-flex">
            <a href="<%= request.getContextPath() %>/home" class="btn btn-outline-primary me-2">
                <i class="fas fa-home"></i> 홈
            </a>
            <a href="<%= request.getContextPath() %>/products" class="btn btn-outline-success me-2">
                <i class="fas fa-list"></i> 상품 목록
            </a>
            <a href="<%= request.getContextPath() %>/addProduct" class="btn btn-outline-warning">
                <i class="fas fa-plus-circle"></i> 상품 등록
            </a>
        </div>
    </div>
</nav>




<!--<nav class="navbar navbar-expand  navbar-dark bg-dark">-->
<!--		<div class="container">-->
<!--			<div class="navbar-header">-->
<!--				<a class="navbar-brand" href="./welcome">Home</a>-->
<!--			</div>-->
<!--		</div>-->
<!--	</nav>-->