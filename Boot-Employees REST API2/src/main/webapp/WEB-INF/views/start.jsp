<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Start Page</title>
</head>
<body>
    <h2>Start Page</h2>
    
    <form action="/move" method="get">
        <input type="hidden" name="moveType" value="forward">
        <button type="submit">Forward 이동</button>
    </form>

    <form action="/move" method="get">
        <input type="hidden" name="moveType" value="redirect">
        <button type="submit">Redirect 이동</button>
    </form>
</body>
</html>
