<%@ page import="sisviagem.Motorista" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'motorista.label', default: 'Motorista')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>

</head>
<body>

	<g:render template="/layouts/create" model="[entityName]"></g:render>

	<div class="panel panel-default">
		<div class="panel-heading">
			<g:message code="default.create.label" args="[entityName]" />
		</div>
		<div class="panel-body">
			<div id="create-motorista" class="content scaffold-create"	role="main">

				<g:hasErrors bean="${motoristaInstance}">
					<ul class="alert alert-danger" role="alert">
						<g:eachError bean="${motoristaInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</g:hasErrors>

				<g:form url="[resource:motoristaInstance, action:'save']" update="teste" name='formMotorista' class='frm'>
					<fieldset class="form">
						<g:render template="form" />
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="btn btn-primary" 	value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>

		</div>
	</div>





</body>
</html>