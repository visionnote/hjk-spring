<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>권역을 선택하는 폼</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>	
			<p>
			<%
			String strArray[] = {"JAVA","JSP","Android","HTML5"};

			for(int i=0; i<strArray.length;i++) {
				out.println("strArray["+i+"]의 값은:"+strArray[i]+" <br>");
			}
			%>

			<p>
			<%@include file="bottom.jsp"%>
	</body>
</html>
		