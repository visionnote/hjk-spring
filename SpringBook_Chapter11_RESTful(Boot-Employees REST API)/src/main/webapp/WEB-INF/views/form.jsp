<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사용자 등록</title>

    <!-- Font Awesome 아이콘 -->
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
            background-color: #4CAF50;
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
            background-color: #45a049;
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
    <h2><i class="fas fa-user-plus"></i> 사용자 정보 입력</h2>
    <form action="/submit" method="POST">
        <label for="name">이름</label>
        <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required />

        <label for="age">나이</label>
        <input type="text" id="age" name="age" placeholder="나이를 입력하세요" required />

        <button type="submit" class="btn-submit">
            <i class="fas fa-paper-plane"></i> 전송
        </button>
    </form>
</div>
</body>
</html>
