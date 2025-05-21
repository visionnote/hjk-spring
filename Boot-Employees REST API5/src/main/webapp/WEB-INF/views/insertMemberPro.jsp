<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.example.myapp.dao.LogonDBBean" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>member 테이블에 레코드 추가</title>
		<link rel="stylesheet" href="/css/style.css">
	</head>
	<body>
			<%@include file="top.jsp"%>
			<h2>회원 추가 </h2>
			<jsp:useBean id="member" class="com.example.myapp.dto.LogonDataBean">
				<jsp:setProperty name="member" property="*"/>
			</jsp:useBean>
			<%
			try {
				member.setReg_date(new Timestamp(System.currentTimeMillis()));
				member.setMod_date(new Timestamp(System.currentTimeMillis()));
				LogonDBBean logon = LogonDBBean.getInstance();
				logon.insertMember(member);
			} catch (Exception e) {
				out.println("<pre>");
				e.printStackTrace(new java.io.PrintWriter(out));
				out.println("</pre>");
			}
%>

			<%
			member.setReg_date(new Timestamp(System.currentTimeMillis()));
			member.setMod_date(new Timestamp(System.currentTimeMillis()));
			LogonDBBean logon = LogonDBBean.getInstance();
			logon.insertMember(member);
			%>
			<jsp:getProperty name="member" property="id"/>님 회원가입을 축하합니다.
			<p>

			<%@include file="bottom.jsp"%>
	</body>
</html>
		