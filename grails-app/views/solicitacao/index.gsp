
<%@ page import="sisviagem.Solicitacao" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'solicitacao.label', default: 'Solicitacao')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<g:render template="/layouts/index" model="[entityName]"></g:render>


	<div class="panel panel-default">
		<div class="panel-heading">
			<g:message code="default.list.label" args="[entityName]" />
		</div>

		<div class="panel-body">
			<div id="list-solicitacao"
				class="content scaffold-list" role="main">
				<g:if test="${solicitacaoInstanceCount > 0 }">
					<table class='table table-responsive table-condensed table-hover'>
						<thead>
							<tr>
								
							<g:sortableColumn property="origem" title="${message(code: 'solicitacao.origem.label', default: 'Origem')}" />
						
							<g:sortableColumn property="destino" title="${message(code: 'solicitacao.destino.label', default: 'Destino')}" />
						
							<g:sortableColumn property="objetivo" title="${message(code: 'solicitacao.objetivo.label', default: 'Objetivo')}" />
						
							<g:sortableColumn property="observacoes" title="${message(code: 'solicitacao.qtd_pessoa.label', default: 'Qtd passageiros')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'solicitacao.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="data" title="${message(code: 'solicitacao.data.label', default: 'Data')}" />
							<sec:ifLoggedIn>
								<sec:ifAllGranted roles="ROLE_ADMIN">
									<th>Ações</th>
								</sec:ifAllGranted>
							</sec:ifLoggedIn>	
						</tr>
						</thead>
						<tbody>
							<g:each in="${solicitacaoInstanceList}" status="i"
								var="solicitacaoInstance">
								<tr>
									
											<td>${fieldValue(bean: solicitacaoInstance, field: "origem")}</td>
											<td>${fieldValue(bean: solicitacaoInstance, field: "destino")}</td>
											<td>${fieldValue(bean: solicitacaoInstance, field: "objetivo")}</td>
											<td>${fieldValue(bean: solicitacaoInstance, field: "qtd_pessoas")}</td>
											<td>${fieldValue(bean: solicitacaoInstance, field: "status")}</td>
											<td>${fieldValue(bean: solicitacaoInstance, field: "data")}</td>
										
											<td>
												<sec:ifLoggedIn>
													<sec:ifAllGranted roles="ROLE_ADMIN">
														<g:link controller='viagem' action="create" id="${solicitacaoInstance.id}" class="btn btn-xs btn-default" >Gerar viagem</g:link>
													</sec:ifAllGranted>
												</sec:ifLoggedIn>
												
											</td>
							
									
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${solicitacaoInstanceCount ?: 0}" />
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