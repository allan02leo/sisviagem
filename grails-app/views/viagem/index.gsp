
<%@ page import="sisviagem.Viagem" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'viagem.label', default: 'Viagem')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<g:render template="/layouts/index" model="[entityName]"></g:render>


	<div class="panel panel-default">
		<div class="panel-heading">
			<g:message code="default.list.label" args="[entityName]" />
		</div>

		<div class="panel-body">
			<div id="list-viagem"
				class="content scaffold-list" role="main">
				<g:if test="${viagemInstanceCount > 0 }">
					<table class='table table-responsive table-condensed table-hover'>
						<thead>
							<tr>
								
						<g:sortableColumn property="km_saida" title="${message(code: 'viagem.km_saida.label', default: 'Kmsaida')}" />
					
						<g:sortableColumn property="km_chegada" title="${message(code: 'viagem.km_chegada.label', default: 'Kmchegada')}" />
					
						<g:sortableColumn property="data_retorno" title="${message(code: 'viagem.data_retorno.label', default: 'Dataretorno')}" />
					
						<g:sortableColumn property="data_saida" title="${message(code: 'viagem.data_saida.label', default: 'Datasaida')}" />
					
						<th><g:message code="viagem.motorista.label" default="Motorista" /></th>
					
						<th><g:message code="viagem.solicitacao.label" default="Solicitacao" /></th>
					
							<th>Ações</th>
							</tr>
						</thead>
						<tbody>
							<g:each in="${viagemInstanceList}" status="i"
								var="viagemInstance">
								<tr>
									
											<td>${fieldValue(bean: viagemInstance, field: "km_saida")}</td>
											<td>
												<g:link action="show" id="${viagemInstance.id}" class="btn btn-xs btn-default" title="Ver ${fieldValue(bean: viagemInstance, field: "km_saida")}"><i class="fa fa-search"></i></g:link>
												<g:link action="edit" id="${viagemInstance.id}" class="btn btn-xs btn-default" title="Editar ${fieldValue(bean: viagemInstance, field: "km_saida")}"><i class="fa fa-pencil"></i></g:link>
											</td>
							
									
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${viagemInstanceCount ?: 0}" />
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