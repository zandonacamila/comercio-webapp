<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Cadastro - Produto</title>

<spring:url value="/produto/deleta/" var="deleta"></spring:url>
<spring:url value="/produto/altera/" var="altera"></spring:url>
<spring:url value="/produto/salva" var="salva"></spring:url>
<spring:url value="/" var="index"></spring:url>

<!-- Latest compiled and minified CSS --> 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <link href='<spring:url value="/resources/css/bootstrap.css" />' rel="stylesheet" />
<script src='<spring:url value="resources/js/jquery-3.5.1.min.js" /> '></script>
<script src='<spring:url value="resources/js/bootstrap.js" />'></script> -->
</head>
<header class="text-end">
<a href="${index}">Home</a>
</header>
<body>

	<div class="container">
	
		<c:if test="${not empty mensagemErro}">
			<div id="divMensagemErro" class="alert alert-danger" role="alert">
				${mensagemErro}
			</div>
		</c:if>
		
		<c:if test="${not empty mensagemSucesso}">
			<div id="divMensagemSucesso" class="alert alert-success" role="alert">
				${mensagemSucesso}
			</div>
		</c:if>
		<div class="pb-2 mt-4 mb-2 border-bottom"> <!-- page header -->
			<h1>Cadastro - Produto</h1>
		</div>
		<form:form action="${salva}" modelAttribute="produto" enctype="multipart/form-data" cssClass="mb-2">
	
			<form:hidden path="id" />
			<form:hidden path="imagemProd" />
	
			<div class="form-group">
				<label>Nome</label>
				<form:input path="nome" cssClass="form-control" />
			</div>

			<div class="form-group">
				<label>Valor unitário</label>
				<form:input path="valorUnitario" cssClass="form-control" />
			</div>
			
			<div class="form-group">
				<label>Imagem</label>
				<div class="custom-file">
					<input type="file" name="imagem" class="custom-file-input" value="${imagemProduto}" />
					<label class="custom-file-label">Escolha uma imagem</label>
				</div>
			</div>
			
			<c:if test="${produto.id ne 0}">
				<div class="mb-5">
					<img class="img-thumbnail" src="data:image/jpge;base64,${imagemProduto}" alt="imagem não encontrada" />
				</div>
			</c:if>

			<br />
			<br />
	
			<input type="submit" class="btn btn-primary" name="salva" value="${produto.id == 0 ? 'Cadastrar' : 'Alterar'}" />
			
			<c:if test="${produto.id ne 0 }">
				<input type="submit" class="btn btn-warning" name="cancela" value="Cancelar" />
			</c:if>
		</form:form>
		<c:if test="${not empty produtos}">
			<table class="table table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Código</th>
						<th scope="col">Nome</th>
						<th scope="col">Valor unitário</th>
						<th scope="col" colspan="2">Ações</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="produto" items="${produtos}">
						<tr>
							<td scope="row">${produto.id}</td>
							<td>${produto.nome}</td>
							<td>${produto.valorUnitario}</td>
							<td><a href="${altera}${produto.id}" class="btn btn-warning">Alterar</a></td>
							<td><a href="${deleta}${produto.id}" class="btn btn-danger" onclick="return confirm('Deseja excluir este produto?');">Excluir</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$('#divMensagemErro').delay(5000).fadeOut('slow');
				$('#divMensagemSucesso').delay(5000).fadeOut('slow');
				
			})
		</script>
	</div>
</body>
</html>