<%@ page import="sisviagem.Motorista" %>

<div class="form-group ${hasErrors(bean: motoristaInstance, field: 'nome', 'error')} required">
	<label for="nome" class='control-label'>
		<g:message code="motorista.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${motoristaInstance?.nome}" class='form-control'/>

</div>

<div class="form-group ${hasErrors(bean: motoristaInstance, field: 'cnh', 'error')} required">
	<label for="cnh" class="control-label">
		<g:message code="motorista.cnh.label" default="Cnh" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cnh" maxlength="20" required="" value="${motoristaInstance?.cnh}" class='form-control'/>

</div>

<div class="form-group ${hasErrors(bean: motoristaInstance, field: 'cat_cnh', 'error')} required">
	<label for="cat_cnh" class="control-label">
		<g:message code="motorista.cat_cnh.label" default="Catcnh" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cat_cnh" maxlength="2" required="" value="${motoristaInstance?.cat_cnh}" class='form-control'/>

</div>
