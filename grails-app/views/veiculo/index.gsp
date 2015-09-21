
<%@ page import="sisviagem.Veiculo" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'veiculo.label', default: 'Veiculo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<g:render template="/layouts/index" model="[entityName]"></g:render>


	<div class="panel panel-default">
		<div class="panel-heading">
			<g:message code="default.list.label" args="[entityName]" />
		</div>

		<div class="panel-body">
			<div id="list-veiculo"
				class="content scaffold-list" role="main">
				<g:if test="${veiculoInstanceCount > 0 }">
					<table class='table table-responsive table-condensed table-hover'>
						<thead>
							<tr>
								
						<g:sortableColumn property="placa" title="${message(code: 'veiculo.placa.label', default: 'Placa')}" />
					
						<g:sortableColumn property="passageiros" title="${message(code: 'veiculo.passageiros.label', default: 'Passageiros')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'veiculo.descricao.label', default: 'Descricao')}" />
					
							<th>Ações</th>
							</tr>
						</thead>
						<tbody>
							<g:each in="${veiculoInstanceList}" status="i"
								var="veiculoInstance">
								<tr>
									
											<td>${fieldValue(bean: veiculoInstance, field: "placa")}</td>
											<td>${fieldValue(bean: veiculoInstance, field: "passageiros")}</td>
											<td>${fieldValue(bean: veiculoInstance, field: "descricao")}</td>
											<td>
												<g:link action="show" id="${veiculoInstance.id}" class="btn btn-xs btn-default" title="Ver ${fieldValue(bean: veiculoInstance, field: "placa")}"><i class="fa fa-search"></i></g:link>
												<g:link action="edit" id="${veiculoInstance.id}" class="btn btn-xs btn-default" title="Editar ${fieldValue(bean: veiculoInstance, field: "placa")}"><i class="fa fa-pencil"></i></g:link>
											</td>
							
									
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${veiculoInstanceCount ?: 0}" />
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