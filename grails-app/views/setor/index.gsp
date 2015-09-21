
<%@ page import="sisviagem.Setor" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'setor.label', default: 'Setor')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<g:render template="/layouts/index" model="[entityName]"></g:render>


	<div class="panel panel-default">
		<div class="panel-heading">
			<g:message code="default.list.label" args="[entityName]" />
		</div>

		<div class="panel-body">
			<div id="list-setor"
				class="content scaffold-list" role="main">
				<g:if test="${setorInstanceCount > 0 }">
					<table class='table table-responsive table-condensed table-hover'>
						<thead>
							<tr>
								
						<g:sortableColumn property="nome" title="${message(code: 'setor.nome.label', default: 'Nome')}" />
					
							<th>Ações</th>
							</tr>
						</thead>
						<tbody>
							<g:each in="${setorInstanceList}" status="i"
								var="setorInstance">
								<tr>
									
											<td>${fieldValue(bean: setorInstance, field: "nome")}</td>
											<td>
												<g:link action="show" id="${setorInstance.id}" class="btn btn-xs btn-default" title="Ver ${fieldValue(bean: setorInstance, field: "nome")}"><i class="fa fa-search"></i></g:link>
												<g:link action="edit" id="${setorInstance.id}" class="btn btn-xs btn-default" title="Editar ${fieldValue(bean: setorInstance, field: "nome")}"><i class="fa fa-pencil"></i></g:link>
											</td>
							
									
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${setorInstanceCount ?: 0}" />
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