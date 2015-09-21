
<%@ page import="sisviagem.Solicitacao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitacao.label', default: 'Solicitacao')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<g:render template="/layouts/menu" model="[entityName]"></g:render>
		
		<div class="panel panel-default">

			<div class="panel-heading">
				<g:message code="default.show.label" args="[entityName]" />
			</div>
			
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			
			<div class="panel-body">
				<div id="show-solicitacao" class="content scaffold-show" role="main">
					<table class='table table-hover'>
						<tbody>
							
								<g:if test="${solicitacaoInstance?.origem}">
									<tr>
										<th><g:message code="solicitacao.origem.label" default="Origem" /></th>
										<td><g:fieldValue bean="${solicitacaoInstance}" field="origem"/></td>
									</tr>
								</g:if>
								
								<g:if test="${solicitacaoInstance?.destino}">
									<tr>
										<th><g:message code="solicitacao.destino.label" default="Destino" /></th>
										<td><g:fieldValue bean="${solicitacaoInstance}" field="destino"/></td>
									</tr>
								</g:if>
								
								<g:if test="${solicitacaoInstance?.objetivo}">
									<tr>
										<th><g:message code="solicitacao.objetivo.label" default="Objetivo" /></th>
										<td><g:fieldValue bean="${solicitacaoInstance}" field="objetivo"/></td>
									</tr>
								</g:if>
								
								<g:if test="${solicitacaoInstance?.observacoes}">
									<tr>
										<th><g:message code="solicitacao.observacoes.label" default="Observacoes" /></th>
										<td><g:fieldValue bean="${solicitacaoInstance}" field="observacoes"/></td>
									</tr>
								</g:if>
								
								<g:if test="${solicitacaoInstance?.status}">
									<tr>
										<th><g:message code="solicitacao.status.label" default="Status" /></th>
										<td><g:fieldValue bean="${solicitacaoInstance}" field="status"/></td>
									</tr>
								</g:if>
								
								<g:if test="${solicitacaoInstance?.data}">
									<tr>
										<th><g:message code="solicitacao.data.label" default="Data" /></th>
										<td><g:fieldValue bean="${solicitacaoInstance}" field="data"/></td>
									</tr>
								</g:if>
								
								<g:if test="${solicitacaoInstance?.qtd_pessoas}">
									<tr>
										<th><g:message code="solicitacao.qtd_pessoas.label" default="Qtdpessoas" /></th>
										<td><g:fieldValue bean="${solicitacaoInstance}" field="qtd_pessoas"/></td>
									</tr>
								</g:if>
								
								<g:if test="${solicitacaoInstance?.user?.username}">
									<tr>
										<th><g:message code="solicitacao.user.label" default="User" /></th>
										<td><g:fieldValue bean="${solicitacaoInstance}" field="user"/></td>
									</tr>
								</g:if>
								
						</tbody>
					</table>

					
				</div>
			</div>
		</div>
	</body>
</html>	
