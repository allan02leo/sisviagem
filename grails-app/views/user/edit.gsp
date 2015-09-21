<%@ page import="sisviagem.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<g:render template="/layouts/menu" model="[entityName]"></g:render>

		<div class="panel panel-default">
			<div class="panel-heading">
				<g:message code="default.edit.label" args="[entityName]" />
			</div>
	
			<div class="panel-body">
				<div id="edit-user" class="content scaffold-edit" role="main">
					<g:hasErrors bean="${userInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${userInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
						</g:hasErrors>
					<g:form url="[resource:userInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${userInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						</fieldset>
					</g:form>
				
				</div>
			
			</div>
		</div>
	
	</body>
</html>
