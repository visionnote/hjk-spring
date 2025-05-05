<!-- /WEB-INF/views/move.jsp -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이동 테스트</title>
</head>
<body>
    <h1>이동 테스트 페이지</h1>

    <form action="/move-process" method="get">
        <input type="hidden" name="moveType" value="forward">
        <button type="submit">Forward 이동</button>
    </form>

    <form action="/move-process" method="get">
        <input type="hidden" name="moveType" value="redirect">
        <button type="submit">Redirect 이동</button>
    </form>
</body>
</html>
