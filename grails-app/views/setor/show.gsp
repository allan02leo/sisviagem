
<%@ page import="sisviagem.Setor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'setor.label', default: 'Setor')}" />
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
				<div id="show-setor" class="content scaffold-show" role="main">
					<table class='table table-hover'>
						<tbody>
							
								<g:if test="${setorInstance?.nome}">
									<tr>
										<th><g:message code="setor.nome.label" default="Nome" /></th>
										<td><g:fieldValue bean="${setorInstance}" field="nome"/></td>
									</tr>
								</g:if>
								
								<g:if test="${setorInstance?.users}">
									<tr>
										<th><g:message code="setor.users.label" default="Users" /></th>
										<td><g:fieldValue bean="${setorInstance}" field="users"/></td>
									</tr>
								</g:if>
								
						</tbody>
					</table>

					<g:form url="[resource:setorInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:link class="btn btn-sm btn-warning" action="edit" resource="${setorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="btn btn-sm btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>	
