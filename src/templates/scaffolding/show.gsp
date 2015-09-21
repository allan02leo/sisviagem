<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<g:render template="/layouts/menu" model="[entityName]"></g:render>
		
		<div class="panel panel-default">

			<div class="panel-heading">
				<g:message code="default.show.label" args="[entityName]" />
			</div>
			
			<g:if test="\${flash.message}">
				<div class="alert alert-success" role="status">\${flash.message}</div>
			</g:if>
			
			<div class="panel-body">
				<div id="show-${domainClass.propertyName}" class="content scaffold-show" role="main">
					<table class='table table-hover'>
						<tbody>
							<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
								allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
								props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
								Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
								props.each { p -> %>
								<g:if test="\${${propertyName}?.${p.name}}">
									<tr>
										<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
										<td><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></td>
									</tr>
								</g:if>
								<%  } %>
						</tbody>
					</table>

					<g:form url="[resource:${propertyName}, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:link class="btn btn-sm btn-warning" action="edit" resource="\${${propertyName}}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="btn btn-sm btn-danger" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>	
