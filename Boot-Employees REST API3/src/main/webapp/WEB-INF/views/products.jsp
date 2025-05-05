<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.myapp.dto.Product" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
    List<Product> listOfProducts = (List<Product>) request.getAttribute("listOfProducts");
%>
<html>
<head>
    <title>상품 목록</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>

<jsp:include page="menu.jsp" />

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">상품 목록</h1>
    </div>
</div>

<div class="container">
    <div class="row text-center">

        <%
            if (listOfProducts != null && !listOfProducts.isEmpty()) {
                for (Product product : listOfProducts) {
        %>
        <div class="col-md-4 mb-4">
            <img src="<%= request.getContextPath() %>/images/<%= product.getFilename() %>"
                 alt="제품 이미지"
                 style="width: 100%; height: 250px; object-fit: cover;">
				 
    		<img src="<%= request.getContextPath() %>/images/thumb_<%= product.getFilename() %>"
				      alt="제품 썸네일"
				      style="width: 50px; height: 50px; object-fit: cover;"
				      onerror="this.onerror=null; this.src='<%= request.getContextPath() %>/images/default.png';">
	 
            <h3><%= product.getProductName() %></h3>
            <p><%= product.getDescription() %></p>
            <p><strong><%= product.getUnitPrice() %>원</strong></p>
            <p>
                <a href="<%= request.getContextPath() %>/product?id=<%= product.getProductId() %>"
                   class="btn btn-secondary btn-sm">상세 정보 &raquo;</a>

<!--                <form action="/deleteProduct" method="post" style="display:inline;">-->
<!--                    <input type="hidden" name="productId" value="<%= product.getProductId() %>">-->
<!--                    <button type="submit" class="btn btn-danger btn-sm">삭제</button>-->
<!--                </form>-->
			<a href="<%= request.getContextPath() %>/editProduct?id=<%= product.getProductId() %>" 
			     class="btn btn-warning btn-sm">수정</a>
				 <button type="button" class="btn btn-danger btn-sm delete-btn"
				         data-id="<%= product.getProductId() %>"
				         data-filename="<%= product.getFilename() %>">
				     삭제
				 </button>

            </p>
        </div>
        <%
                }  
            } else {
        %>
        <div class="col-12">
            <p>등록된 상품이 없습니다.</p>
        </div>
        <%
            }
        %>
    </div>
    <hr>
</div>

<jsp:include page="footer.jsp" />

<script>
    $(document).ready(function(){
        $(".delete-btn").click(function(){
            var productId = $(this).data("id");
			var filename = $(this).data("filename");

            // 확인창 표시
            if(confirm("정말로 이 상품을 삭제하시겠습니까?")) {
                // Ajax 요청
                $.ajax({
                    url: '/deleteProduct',
                    type: 'POST',
                    data: {
                        productId: productId						,
						 filename: filename

                    },
                    success: function(response) {
                        // 성공하면 해당 상품 삭제 후 페이지에서 제거
                        alert("상품이 삭제되었습니다.");
                        location.reload();  // 페이지 새로고침
                    },
                    error: function() {
                        alert("삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
                    }
                });
            }
        });
    });
</script>

</body>
</html>
