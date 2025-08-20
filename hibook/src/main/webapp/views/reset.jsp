<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/reset-password" method="post">
    <input type="hidden" name="uid" value="${uid}">
    <input type="hidden" name="token_id" value="${token_id}">
    <label>Mật khẩu mới:</label>
    <input type="password" name="password" required />
    <button type="submit">Đặt lại mật khẩu</button>
</form>
</body>
</html>