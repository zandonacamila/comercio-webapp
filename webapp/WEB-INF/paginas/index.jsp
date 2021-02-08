<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<spring:url value="produto/" var="produto"></spring:url>
<spring:url value="cliente/" var="cliente"></spring:url>
<title>Qintess - ComercioOnline</title>
</head>
<div class="container">
	<header class="navbar-nav text-end">
		<a class="nav-link active" aria-current="page" href="${produto}">Produtos</a>
		<a class="nav-link active" aria-current="page" href="${cliente}">Clientes</a>
	</header>
	<body class="text-center">
		<h1 class="display-1">Free Market</h1>
	</body>
</div>
</html>