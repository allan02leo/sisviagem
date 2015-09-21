
<%@ page import="sisviagem.Motorista" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'motorista.label', default: 'Motorista')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<g:render template="/layouts/menu" model="[entityName]"></g:render>
	<div class="panel panel-default">

		<div class="panel-heading">
			<g:message code="default.show.label" args="[entityName]" />
		</div>
		<g:if test="${flash.message}">
			<div class="alert alert-success" role="status">
				${flash.message}
			</div>
		</g:if>

		<div class="panel-body">

			<div id="show-motorista" class="content scaffold-show" role="main">

				<g:if test="${motoristaInstance?.nome}">
					<table class='table table-hover'>
						<tbody>
							<tr>
								<th><g:message code="motorista.nome.label" default="Nome" /></th>
								<td><g:fieldValue bean="${motoristaInstance}" field="nome" /></td>
							</tr>
							<tr>
								<th><g:message code="motorista.cnh.label" default="CNH" /></th>
								<td><g:fieldValue bean="${motoristaInstance}" field="cnh" /></td>
							</tr>
							<tr>
								<th><g:message code="motorista.cat_cnh.label"
										default="Categoria" /></th>
								<td><g:fieldValue bean="${motoristaInstance}"
										field="cat_cnh" /></td>
							</tr>
						</tbody>
					</table>

				</g:if>


				<g:form url="[resource:motoristaInstance, action:'delete']"
					method="DELETE">
					<fieldset class="buttons">
						<g:link class="btn btn-sm btn-warning" action="edit"
							resource="${motoristaInstance}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:actionSubmit class="btn btn-sm btn-danger" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>


		</div>


	</div>

</body>
</html>