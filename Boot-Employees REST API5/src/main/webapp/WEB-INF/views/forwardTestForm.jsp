<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>for</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>
			<h2>forward 액션태그 </h2>
			<form method="post" action="forwardTest">
				아이디:<input type="text" name="id"><br>
				취미:
				<select name="hobby">
				 <option value="WOW">WOW</option>
				 <option value="만화보기">만화보기</option>
				 <option value="스타2-군단의심장">스타2-군단의심장</option>
				</select><br>
				<input type="submit" value="입력완료">										
			</form>
			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		