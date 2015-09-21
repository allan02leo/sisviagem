
<%@ page import="sisviagem.Motorista" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'motorista.label', default: 'Motorista')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<g:render template="/layouts/index" model="[entityName]"></g:render>
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<g:message code="default.list.label" args="[entityName]" />
		</div>

		<div class="panel-body">
			<div id="list-motorista" class="content scaffold-list" role="main">
				
				<g:if test="${motoristaInstanceCount > 0}">

					<table class='table table-responsive table-condensed table-hover'>
						<thead>
							<tr>
	
								<g:sortableColumn property="nome"
									title="${message(code: 'motorista.nome.label', default: 'Nome')}" />
	
								<g:sortableColumn property="cnh"
									title="${message(code: 'motorista.cnh.label', default: 'Cnh')}" />
	
								<g:sortableColumn property="cat_cnh"
									title="${message(code: 'motorista.cat_cnh.label', default: 'Catcnh')}" />
								<td>Ações</td>
	
							</tr>
						</thead>
						<tbody>
							<g:each in="${motoristaInstanceList}" status="i"
								var="motoristaInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
	
									<td>
										${fieldValue(bean: motoristaInstance, field: "nome")}
									</td>
									<td>
										${fieldValue(bean: motoristaInstance, field: "cnh")}
									</td>
									<td>
										${fieldValue(bean: motoristaInstance, field: "cat_cnh")}
									</td>
									<td><g:link action="show" id="${motoristaInstance.id}"
											class='btn btn-xs btn-default' title='Ver motorista'>
											<i class='fa fa-search'></i>
										</g:link> <g:link action="edit" id="${motoristaInstance.id}"
											class='btn btn-xs btn-default' title='Editar motorista'>
											<i class='fa fa-pencil'></i>
										</g:link></td>
	
								</tr>
							</g:each>
						</tbody>
					</table>
				</g:if>	
				<g:else>
					Nenhum motorista cadastrado
				</g:else>

			</div>
		</div>
	</div>
</body>
</html>