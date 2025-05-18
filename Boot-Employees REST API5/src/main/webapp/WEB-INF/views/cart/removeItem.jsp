<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>장바구니 상품 삭제</title>
</head>
<body>
    <div class="container mt-5">
        <h2>상품 삭제</h2>
        <form action="/cart/remove" method="post">
            <div class="form-group">
                <label>삭제할 상품 ID:</label>
                <input type="text" name="productId" class="form-control" required>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-danger" value="삭제">
            </div>
        </form>
    </div>
</body>
</html>
