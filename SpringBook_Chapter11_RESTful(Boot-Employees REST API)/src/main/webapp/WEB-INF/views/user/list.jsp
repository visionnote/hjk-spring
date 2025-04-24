<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.age}</td>
            <td>
                <a href="${pageContext.request.contextPath}/user/edit/${user.id}">Edit</a>
            </td>
        </tr>
    </c:forEach>
</table>
