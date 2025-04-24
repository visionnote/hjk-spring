<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사용자 목록</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 30px;
            background-color: #f9f9f9;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        .btn {
            padding: 8px 12px;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .btn-danger {
            background-color: #f44336;
        }

        .btn-danger:hover {
            background-color: #d32f2f;
        }

        .btn-secondary {
            background-color: #2196F3;
        }

        .btn-secondary:hover {
            background-color: #1976D2;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        .action-links a {
            margin: 0 5px;
        }
    </style>
</head>
<body>
    <h1>사용자 목록</h1>

    <!-- 검색 폼 -->
    <!-- <form action="/users" method="get">
        <input type="text" name="name" placeholder="이름으로 검색" value="${name}" />
        <button type="submit" class="btn">검색</button>
    </form> -->

    <form action="${pageContext.request.contextPath}/search" method="get">
        <input type="text" name="keyword" value="${keyword}" placeholder="이름 검색" />
        <button type="submit">검색</button>
    </form>
    

    <!-- 등록 버튼 -->
    <p>
        <a href="/form" class="btn">+ 사용자 등록</a>
    </p>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>나이</th>
                <th>작업</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.age}</td>
                    <td class="action-links">
                        <a href="/edit/${user.id}" class="btn btn-secondary">수정</a>
                        <a href="/delete/${user.id}" class="btn btn-danger"
                           onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
