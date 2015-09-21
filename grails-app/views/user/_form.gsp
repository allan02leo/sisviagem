<%@ page import="sisviagem.User" %>



<div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}" class='form-control'/>

</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" required="" value="${userInstance?.password}" class='form-control'/>
</div>




<div class="form-group ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${userInstance?.email}" class='form-control'/>

</div>

<sec:ifAllGranted roles="ROLE_ADMIN">
	<div class="form-group ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
		<label for="enabled">
			<g:message code="user.enabled.label" default="Enabled" />
			
		</label>
		<g:checkBox name="enabled" value="${userInstance?.enabled}" />
	
	</div>



	<div class="form-group ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
		<label for="accountLocked">
			<g:message code="user.accountLocked.label" default="Account Locked" />
			
		</label>
		<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
	
	</div>
	<div class="form-group ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
		<label for="accountExpired">
			<g:message code="user.accountExpired.label" default="Account Expired" />
			
		</label>
		<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
	
	</div>
	
		
	<div class="form-group ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
		<label for="passwordExpired">
			<g:message code="user.passwordExpired.label" default="Password Expired" />
			
		</label>
		<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
	
	</div>
</sec:ifAllGranted>
<div class="form-group ${hasErrors(bean: userInstance, field: 'setor', 'error')} required">
	<label for="setor">
		<g:message code="user.setor.label" default="Setor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="setor" name="setor.id" from="${sisviagem.Setor.list()}" optionKey="id" required="" value="${userInstance?.setor?.id}" optionValue="nome" class="many-to-one form-control"/>
	
</div>

<sec:ifAllGranted roles="ROLE_ADMIN">
	<label for="setor">
		Tipo de usuário
	</label>
	<g:select name="role" from="${['ROLE_USER', 'ROLE_ADMIN']}" value='ROLE_USER' class='form-control'/>
	</sec:ifAllGranted>
	
	<sec:ifNotLoggedIn>
	<div class="hidden"><g:textField name="role" value="ROLE_USER"/></div>
</sec:ifNotLoggedIn>

<div class="form-group ${hasErrors(bean: userInstance, field: 'siape', 'error')} required">
	<label for="siape">
		<g:message code="user.siape.label" default="Siape" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="siape" required="" value="${userInstance?.siape}" class='form-control'/>

</div>

