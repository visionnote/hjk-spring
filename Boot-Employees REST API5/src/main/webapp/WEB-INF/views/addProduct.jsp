<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script type="text/javascript" src="/js/validation.js"></script>
	<title><spring:message code="title" /></title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><spring:message code="title" /></h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" id="newProduct" action="/addProduct_process" class="form-horizontal" method="post" enctype="multipart/form-data" onsubmit="return CheckAddProduct();">

			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="productName" /></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="productName" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="unitPrice" /></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="description" /></label>
				<div class="col-sm-5">
					<textarea id="description" name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="manufacturer" /></label>
				<div class="col-sm-3">
					<input type="text" id="manufacturer" name="manufacturer" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="category" /></label>
				<div class="col-sm-3">
					<input type="text" id="category" name="category" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="unitsInStock" /></label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="condition" /></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New"> <spring:message code="condition_New" />
					<input type="radio" name="condition" value="Old"> <spring:message code="condition_Old" />
					<input type="radio" name="condition" value="Refurbished"> <spring:message code="condition_Refurbished" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"><spring:message code="productImage" /></label>
				<div class="col-sm-3">
					<input type="file" id="filename" name="filename" class="form-control" accept="image/*">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-10 ms-auto">
					<input type="submit" class="btn btn-primary" value="<spring:message code='button' />">
				</div>
			</div>

		</form>
	</div>
</body>
</html>
