<%@ page contentType="text/html; charset=utf-8" %>
<%-- <%@ page import="dto.Product"%> --%>
<%@ page import="com.example.myapp.dto.Product" %>
<jsp:useBean id="productDAO" class="com.example.myapp.dao.ProductRepository" scope="session" />
<html>
	<head>
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/bootstrap.min.css">
		<title>상품 상세 정보</title>
	</head>
	<body>
		<jsp:include page="menu.jsp" />
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">상품 정보</h1>
			</div>
		</div>
		<%
		    String id = request.getParameter("id");
			Product product = productDAO.getProductById(id);
		%>
			<% if (id == null || id.trim().isEmpty()) { %>
			    <p>상품 ID가 전달되지 않았습니다.</p>
			<% } else if (product == null) { %>
			    <p>해당 ID에 해당하는 상품을 찾을 수 없습니다. (id: <%= id %>)</p>
			<% } else { %>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h3><%=product.getProductName()%></h3>
					<p><%=product.getDescription()%></p>
					<p><b>상품 코드: </b><span class="badge badge-danger">
						<%=product.getProductId()%></span>
					<p><b>제조사</b>: <%=product.getManufacturer() %>
					<p><b>분류</b>:<%=product.getCategory() %>
					<p><b>재고 수</b>:<%=product.getUnitsInStock()%>
					<h4><%=product.getUnitPrice()%>원</h4>
					<% } %>
					<p><a href="/products" class="btn btn-secondary">상품 목록 &raquo;</a>
				</div>
			</div>
		</div>					
		<hr>				
	</div>
	<jsp:include page="footer.jsp" />				
	</body>
</html>	