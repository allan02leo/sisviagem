<%@ page import="sisviagem.Setor" %>

<div class="form-group ${hasErrors(bean: setorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="setor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${setorInstance?.nome}" class='form-control'/>

</div>

