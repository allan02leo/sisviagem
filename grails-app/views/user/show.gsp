
<%@ page import="sisviagem.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<g:render template="/layouts/menu" model="[entityName]"></g:render>
		
		<div class="panel panel-default">

			<div class="panel-heading">
				<g:message code="default.show.label" args="[entityName]" />
			</div>
			
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>
			
			<div class="panel-body">
				<div id="show-user" class="content scaffold-show" role="main">
					<table class='table table-hover'>
						<tbody>
							
								<g:if test="${userInstance?.username}">
									<tr>
										<th><g:message code="user.username.label" default="Username" /></th>
										<td><g:fieldValue bean="${userInstance}" field="username"/></td>
									</tr>
								</g:if>
								
								<g:if test="${userInstance?.password}">
									<tr>
										<th><g:message code="user.password.label" default="Password" /></th>
										<td><g:fieldValue bean="${userInstance}" field="password"/></td>
									</tr>
								</g:if>
								
								<g:if test="${userInstance?.accountExpired}">
									<tr>
										<th><g:message code="user.accountExpired.label" default="Account Expired" /></th>
										<td><g:fieldValue bean="${userInstance}" field="accountExpired"/></td>
									</tr>
								</g:if>
								
								<g:if test="${userInstance?.accountLocked}">
									<tr>
										<th><g:message code="user.accountLocked.label" default="Account Locked" /></th>
										<td><g:fieldValue bean="${userInstance}" field="accountLocked"/></td>
									</tr>
								</g:if>
								
								<g:if test="${userInstance?.email}">
									<tr>
										<th><g:message code="user.email.label" default="Email" /></th>
										<td><g:fieldValue bean="${userInstance}" field="email"/></td>
									</tr>
								</g:if>
								
								<g:if test="${userInstance?.enabled}">
									<tr>
										<th><g:message code="user.enabled.label" default="Enabled" /></th>
										<td><g:fieldValue bean="${userInstance}" field="enabled"/></td>
									</tr>
								</g:if>
								
								<g:if test="${userInstance?.passwordExpired}">
									<tr>
										<th><g:message code="user.passwordExpired.label" default="Password Expired" /></th>
										<td><g:fieldValue bean="${userInstance}" field="passwordExpired"/></td>
									</tr>
								</g:if>
								
								<g:if test="${userInstance?.setor}">
									<tr>
										<th><g:message code="user.setor.label" default="Setor" /></th>
										<td><g:fieldValue bean="${userInstance}" field="setor"/></td>
									</tr>
								</g:if>
								
								<g:if test="${userInstance?.siape}">
									<tr>
										<th><g:message code="user.siape.label" default="Siape" /></th>
										<td><g:fieldValue bean="${userInstance}" field="siape"/></td>
									</tr>
								</g:if>
								
						</tbody>
					</table>

					<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:link class="btn btn-sm btn-warning" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="btn btn-sm btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>	
