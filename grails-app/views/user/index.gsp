
<%@ page import="sisviagem.User" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<g:render template="/layouts/index" model="[entityName]"></g:render>


	<div class="panel panel-default">
		<div class="panel-heading">
			<g:message code="default.list.label" args="[entityName]" />
		</div>

		<div class="panel-body">
			<div id="list-user"
				class="content scaffold-list" role="main">
				<g:if test="${userInstanceCount > 0 }">
					<table class='table table-responsive table-condensed table-hover'>
						<thead>
							<tr>
								
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="setor" title="${message(code: 'user.setor.label', default: 'Setor')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />
						
						<g:sortableColumn property="siape" title="${message(code: 'user.siape.label', default: 'Siape')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Ativo')}" />
					
							<th>Ações</th>
							</tr>
						</thead>
						<tbody>
							<g:each in="${userInstanceList}" status="i"
								var="userInstance">
								<tr>
									
											<td>${fieldValue(bean: userInstance, field: "username")}</td>
											<td>${fieldValue(bean: userInstance, field: "setor.nome")}</td>
											<td>${fieldValue(bean: userInstance, field: "email")}</td>
											<td>${fieldValue(bean: userInstance, field: "siape")}</td>
											<td>${fieldValue(bean: userInstance, field: "enabled") == 'true' ? 'Ativo': 'Inativo'}</td>
											<td>
												<g:link action="show" id="${userInstance.id}" class="btn btn-xs btn-default" title="Ver ${fieldValue(bean: userInstance, field: "username")}"><i class="fa fa-search"></i></g:link>
												<g:link action="edit" id="${userInstance.id}" class="btn btn-xs btn-default" title="Editar ${fieldValue(bean: userInstance, field: "username")}"><i class="fa fa-pencil"></i></g:link>
											</td>
							
									
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${userInstanceCount ?: 0}" />
					</div>
				</g:if>
				<g:else>
						Nenhum registro encontrado
					</g:else>
			</div>
		</div>
	</div>

</body>
</html>