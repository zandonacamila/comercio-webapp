<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Qintess - ComercioOnline</title>
	<spring:url value="produto/" var="produto"></spring:url>

</head>
<body>
	<h1>Index do site!</h1>
	<hr />
	<a href="${produto}">CRUD Produto</a>
</body>
</html>