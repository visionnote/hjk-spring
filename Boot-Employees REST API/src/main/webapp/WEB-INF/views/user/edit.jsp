<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사용자 정보 수정</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
            background-color: #f4f4f4;
            margin: 0;
        }

        .container {
            max-width: 500px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .btn-submit {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #2196F3;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-submit i {
            margin-right: 8px;
        }

        .btn-submit:hover {
            background-color: #1976D2;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2><i class="fas fa-user-edit"></i> 사용자 정보 수정</h2>
    <form action="/update" method="POST">
        <input type="hidden" name="id" value="${user.id}" />

        <label for="name">이름</label>
        <input type="text" id="name" name="name" value="${user.name}" required />

        <label for="age">나이</label>
        <input type="text" id="age" name="age" value="${user.age}" required />

        <button type="submit" class="btn-submit">
            <i class="fas fa-save"></i> 저장하기
        </button>
    </form>
</div>
</body>
</html>
