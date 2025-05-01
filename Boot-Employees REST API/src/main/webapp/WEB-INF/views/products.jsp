<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.example.myapp.dto.Product" %>
<%@ page import="com.example.myapp.dao.ProductRepository" %>

<jsp:useBean id="productDAO" class="com.example.myapp.dao.ProductRepository" scope="session"/>
<html>
    <head> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <title>상품 목록</title>
    </head>
</html>
   <jsp:include page="menu.jsp" />
   <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품 목록</h1>
        </div>
   </div>
   <%
   	    ProductRepository dao = ProductRepository.getInstance(); 
        ArrayList<Product> listOfProducts = dao.getAllProducts();
    %>
    <div class="container">
        <div class="row" align="center">
            <%
                for(int i = 0; i<listOfProducts.size();i++) {
                Product product = listOfProducts.get(i);
            %>
            <div class="col-md-4">
                <h3><%=product.getProductName() %></h3>
                <p><%=product.getDescription()%></p>
                <p><%=product.getUnitPrice()%>원</p>
				<%
				    if (product != null) {
				%>		
				    <p><a href="./product?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button">
				        상세 정보 &raquo;
				    </a></p>
				<%
				    } else {
				        out.println("product 객체가 전달되지 않았습니다.");
				    }
				%>

            </div>
            <%   
                }
            %>
        </div>
        <hr>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>