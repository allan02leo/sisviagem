
<%@ page import="sisviagem.Viagem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'viagem.label', default: 'Viagem')}" />
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
				<div id="show-viagem" class="content scaffold-show" role="main">
					<table class='table table-hover'>
						<tbody>
							
								<g:if test="${viagemInstance?.km_saida}">
									<tr>
										<th><g:message code="viagem.km_saida.label" default="Kmsaida" /></th>
										<td><g:fieldValue bean="${viagemInstance}" field="km_saida"/></td>
									</tr>
								</g:if>
								
								<g:if test="${viagemInstance?.km_chegada}">
									<tr>
										<th><g:message code="viagem.km_chegada.label" default="Kmchegada" /></th>
										<td><g:fieldValue bean="${viagemInstance}" field="km_chegada"/></td>
									</tr>
								</g:if>
								
								<g:if test="${viagemInstance?.data_retorno}">
									<tr>
										<th><g:message code="viagem.data_retorno.label" default="Dataretorno" /></th>
										<td><g:fieldValue bean="${viagemInstance}" field="data_retorno"/></td>
									</tr>
								</g:if>
								
								<g:if test="${viagemInstance?.data_saida}">
									<tr>
										<th><g:message code="viagem.data_saida.label" default="Datasaida" /></th>
										<td><g:fieldValue bean="${viagemInstance}" field="data_saida"/></td>
									</tr>
								</g:if>
								
								<g:if test="${viagemInstance?.motorista}">
									<tr>
										<th><g:message code="viagem.motorista.label" default="Motorista" /></th>
										<td><g:fieldValue bean="${viagemInstance}" field="motorista"/></td>
									</tr>
								</g:if>
								
								<g:if test="${viagemInstance?.solicitacao}">
									<tr>
										<th><g:message code="viagem.solicitacao.label" default="Solicitacao" /></th>
										<td><g:fieldValue bean="${viagemInstance}" field="solicitacao"/></td>
									</tr>
								</g:if>
								
								<g:if test="${viagemInstance?.status}">
									<tr>
										<th><g:message code="viagem.status.label" default="Status" /></th>
										<td><g:fieldValue bean="${viagemInstance}" field="status"/></td>
									</tr>
								</g:if>
								
								<g:if test="${viagemInstance?.veiculo}">
									<tr>
										<th><g:message code="viagem.veiculo.label" default="Veiculo" /></th>
										<td><g:fieldValue bean="${viagemInstance}" field="veiculo"/></td>
									</tr>
								</g:if>
								
						</tbody>
					</table>

					<g:form url="[resource:viagemInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:link class="btn btn-sm btn-warning" action="edit" resource="${viagemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="btn btn-sm btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>	
