<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Homepage</h1>
	<c:set var="user_account " value="${sessionScope.user_account }"></c:set>
	
	<p>Xin chào: ${user_account.fullname }</p>
</body>
</html>