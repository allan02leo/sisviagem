
<%@ page import="sisviagem.Veiculo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'veiculo.label', default: 'Veiculo')}" />
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
				<div id="show-veiculo" class="content scaffold-show" role="main">
					<table class='table table-hover'>
						<tbody>
							
								<g:if test="${veiculoInstance?.placa}">
									<tr>
										<th><g:message code="veiculo.placa.label" default="Placa" /></th>
										<td><g:fieldValue bean="${veiculoInstance}" field="placa"/></td>
									</tr>
								</g:if>
								
								<g:if test="${veiculoInstance?.passageiros}">
									<tr>
										<th><g:message code="veiculo.passageiros.label" default="Passageiros" /></th>
										<td><g:fieldValue bean="${veiculoInstance}" field="passageiros"/></td>
									</tr>
								</g:if>
								
								<g:if test="${veiculoInstance?.descricao}">
									<tr>
										<th><g:message code="veiculo.descricao.label" default="Descricao" /></th>
										<td><g:fieldValue bean="${veiculoInstance}" field="descricao"/></td>
									</tr>
								</g:if>
								
						</tbody>
					</table>

					<g:form url="[resource:veiculoInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:link class="btn btn-sm btn-warning" action="edit" resource="${veiculoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="btn btn-sm btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>	
