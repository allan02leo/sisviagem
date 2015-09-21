<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<g:render template="/layouts/index" model="[entityName]"></g:render>


	<div class="panel panel-default">
		<div class="panel-heading">
			<g:message code="default.list.label" args="[entityName]" />
		</div>

		<div class="panel-body">
			<div id="list-${domainClass.propertyName}"
				class="content scaffold-list" role="main">
				<g:if test="\${${propertyName}Count > 0 }">
					<table class='table table-responsive table-condensed table-hover'>
						<thead>
							<tr>
								<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.eachWithIndex { p, i ->
							if (i < 6) {
								if (p.isAssociation()) { %>
						<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
					<%      } else { %>
						<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
					<%  }   }   } %>
							<th>Ações</th>
							</tr>
						</thead>
						<tbody>
							<g:each in="\${${propertyName}List}" status="i"
								var="${propertyName}">
								<tr>
									<%  props.eachWithIndex { p, i ->
										if (i == 0) { %>
											<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
											<td>
												<g:link action="show" id="\${${propertyName}.id}" class="btn btn-xs btn-default" title="Ver \${fieldValue(bean: ${propertyName}, field: "${p.name}")}"><i class="fa fa-search"></i></g:link>
												<g:link action="edit" id="\${${propertyName}.id}" class="btn btn-xs btn-default" title="Editar \${fieldValue(bean: ${propertyName}, field: "${p.name}")}"><i class="fa fa-pencil"></i></g:link>
											</td>
							
									<%  }   }    %>
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="\${${propertyName}Count ?: 0}" />
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