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
	<h1>List user categories:</h1>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="item" items="${requestScope.list_cateUser }">
				<tr>
					<td>${item.id }</td>
					<td>${item.name }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>